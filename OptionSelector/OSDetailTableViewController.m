//
//  OSDetailTableViewController.m
//  OptionSelector
//
//  Created by Varindra Hart on 8/10/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "OSDetailTableViewController.h"

@interface OSDetailTableViewController ()

@property (nonatomic) NSDictionary *dictionaryOfOptionsForKey;

@end

@implementation OSDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dictionaryOfOptionsForKey = @{
                                       @"Dogs" : @[@"Daschund", @"Rottweiler", @"Chihuahua", @"Pug", @"Siberian Husky", @"Labrador", @"Boxer", @"Pitbull", @"Dalmation"],
                                       @"Cars" : @[@"Camaro", @"Chevelle", @"Civic", @"Mustang", @"GTO", @"Fusion", @"Impreza"],
                                       @"Foods": @[@"Noodles", @"Banana", @"Taco", @"PB&J", @"Strudel"]
                                       };
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[self.dictionaryOfOptionsForKey objectForKey:self.keyForArrayToBeDisplayed] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OptionsIdentifier" forIndexPath:indexPath];
    
    NSArray *optionsArray = [self.dictionaryOfOptionsForKey objectForKey:self.keyForArrayToBeDisplayed];
    NSString *option = optionsArray[indexPath.row];
    cell.textLabel.text = option;
    cell.accessoryType = UITableViewCellAccessoryNone;
    if([option isEqualToString:self.currentlySelectedOption]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *optionsArray = [self.dictionaryOfOptionsForKey objectForKey:self.keyForArrayToBeDisplayed];
    NSString *newSelection = optionsArray[indexPath.row];
    self.currentlySelectedOption = newSelection;
    [self.tableView reloadData];
    [self.delegate tableView:self updatedSelection:self.currentlySelectedOption];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}


@end
