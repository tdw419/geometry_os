//! Test for ScreenDimensionsConfig in bare_metal module
//!
//! Phase 4 Task 1: Screen dimensions configuration

use infinite_map_rs::bare_metal::screen::ScreenDimensionsConfig;

#[test]
fn test_screen_dimensions_default() {
    let config = ScreenDimensionsConfig::default();
    assert_eq!(config.width, 1920);
    assert_eq!(config.height, 1080);
}

#[test]
fn test_screen_dimensions_new() {
    let config = ScreenDimensionsConfig::new(2560, 1440);
    assert_eq!(config.width, 2560);
    assert_eq!(config.height, 1440);
}
