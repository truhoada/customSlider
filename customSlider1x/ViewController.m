//
//  ViewController.m
//  customSlider1x
//
//  Created by admin on 7/24/15.
//  Copyright (c) 2015 hoangdangtrung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *sliderCustom;
@property (strong, nonatomic) UILabel* label;

@end

@implementation ViewController

/// y tuong la: Set 2 picture, 1 nam 1 nu, tien sat lai gan nhau tuy theo slider value ==> Love /////

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *minImage = [UIImage imageNamed:@"minTrackImg"];
    UIImage *maxImage = [UIImage imageNamed:@"maxTrackImg"];
    UIImage *thumbImage = [UIImage imageNamed:@"thumbImg"];
    UIImage *minValueImage = [UIImage imageNamed:@"lowValueImg"];
    UIImage *maxValueImage = [UIImage imageNamed:@"highValueImg"];
    
    [_sliderCustom setMinimumTrackImage:minImage forState:UIControlStateNormal];
    [_sliderCustom setMaximumTrackImage:maxImage forState:UIControlStateNormal];
    [_sliderCustom setThumbImage:thumbImage forState:UIControlStateNormal];
    [_sliderCustom setMinimumValueImage:minValueImage];
    [_sliderCustom setMaximumValueImage:maxValueImage];
    
    [_sliderCustom setMaximumValue:10.0];
    [_sliderCustom setMinimumValue:0.0];
    [_sliderCustom setValue:5.0];
    
    self.label = [UILabel new];
    [self.sliderCustom addSubview:self.label];
    [self moveLabel];
    
}
- (void) moveLabel{
    CGRect labelPos = [self computeLabelPosition];
    self.label.text = [NSString stringWithFormat:@"%.f", self.sliderCustom.value];
    self.label.frame = labelPos;
}

- (CGRect) computeLabelPosition {
    CGRect sliderBound = self.sliderCustom.bounds;
    // CGRect newTrack = CGRectMake(sliderBound.origin.x+2, sliderBound.origin.y+2, sliderBound.size.width-4, sliderBound.size.height-4);
    CGRect trackRect = [self.sliderCustom trackRectForBounds:sliderBound];
    CGRect thumbRect = [self.sliderCustom thumbRectForBounds:sliderBound
                                                   trackRect:trackRect
                                                       value:self.sliderCustom.value];
    thumbRect.origin = CGPointMake(thumbRect.origin.x+8, 25);
    return thumbRect;
}


- (IBAction)sliderValueChange:(id)sender {
    [self moveLabel];
    
    NSLog(@"%f",_sliderCustom.value);
    if (_sliderCustom.value == _sliderCustom.minimumValue)
    {
        [_sliderCustom setMinimumValueImage:[UIImage imageNamed:@"minValueImg"]];
    }
    else
    {
        [_sliderCustom setMinimumValueImage:[UIImage imageNamed:@"lowValueImg"]];
    }
    
    if (_sliderCustom.value == _sliderCustom.maximumValue)
    {
        [_sliderCustom setMaximumValueImage:[UIImage imageNamed:@"maxValueImg"]];
    }
    else
    {
        [_sliderCustom setMaximumValueImage:[UIImage imageNamed:@"highValueImg"]];
    }
}


@end
