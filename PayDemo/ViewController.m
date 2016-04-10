//
//  ViewController.m
//  PayDemo
//
//  Created by Water on 10/4/16.
//  Copyright © 2016年 Water. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated{
    @autoreleasepool {
        [self Author];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    @autoreleasepool {
        [self Author];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)TouchToVerify:(id)sender {
    [self Author];
}
-(void)viewDidDisappear:(BOOL)animated{
    for(UIView *view in self.view.subviews){[view removeFromSuperview];}
    [self.view removeFromSuperview];
    NSLog(@"exit");
}

-(void)Author{
    @autoreleasepool {
        LAContext  *authenticationContext= [[LAContext alloc]init];
        NSError *error;
        if ([authenticationContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
            [authenticationContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"輕觸TouchID驗證身份" reply:^(BOOL success, NSError * _Nullable error) {
                if (success) {
                    [self performSegueWithIdentifier:@"ToMain" sender:nil];

                }
            }];
        }else{

        }
    }
}
    @end
