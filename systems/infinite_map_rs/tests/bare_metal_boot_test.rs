//! Bare Metal Boot Sequence Tests
//!
//! Task 4 of Phase 4: Bare Metal Boot
//!
//! Tests that validate the boot sequence concept using bare_metal abstractions.
//! Simulates what a bare metal kernel would do during early boot to initialize
//! the display and render a test pattern.

use infinite_map_rs::bare_metal::{GpuFramebuffer, ScreenDimensionsConfig};

#[test]
fn test_bare_metal_boot_sequence() {
    // Test the boot sequence initializes framebuffer
    let config = ScreenDimensionsConfig::default();
    let mut framebuffer = GpuFramebuffer::new(&config);

    // Clear to black (ARGB format)
    framebuffer.clear(0xFF000000);

    // Verify dimensions
    assert_eq!(framebuffer.width(), 1920);
    assert_eq!(framebuffer.height(), 1080);

    // Verify clear worked - all pixels should be black
    assert_eq!(framebuffer.get_pixel(0, 0), 0xFF000000);
    assert_eq!(framebuffer.get_pixel(960, 540), 0xFF000000);
    assert_eq!(framebuffer.get_pixel(1919, 1079), 0xFF000000);
}

#[test]
fn test_boot_test_pattern() {
    // Create a test pattern like the C kernel would
    let config = ScreenDimensionsConfig::new(800, 600);
    let mut fb = GpuFramebuffer::new(&config);

    // Render a simple gradient pattern
    for y in 0..fb.height() {
        for x in 0..fb.width() {
            let r = (x * 255 / fb.width()) as u32;
            let g = (y * 255 / fb.height()) as u32;
            let b = ((x + y) % 256) as u32;
            let color = 0xFF000000 | (r << 16) | (g << 8) | b;
            fb.put_pixel(x, y, color);
        }
    }

    // Verify some pixels
    assert_ne!(fb.get_pixel(0, 0), 0, "Top-left should have color");
    assert_ne!(fb.get_pixel(400, 300), 0, "Center should have color");
    assert_ne!(fb.get_pixel(799, 599), 0, "Bottom-right should have color");
}

#[test]
fn test_boot_clear_to_color() {
    // Test that boot can clear to any color (e.g., blue for brand)
    let config = ScreenDimensionsConfig::new(640, 480);
    let mut fb = GpuFramebuffer::new(&config);

    // Clear to a test color (bright blue)
    let boot_color = 0xFF0066CC;
    fb.clear(boot_color);

    // Verify all pixels are the boot color
    for y in 0..fb.height() {
        for x in 0..fb.width() {
            assert_eq!(fb.get_pixel(x, y), boot_color);
        }
    }
}

#[test]
fn test_boot_splash_pattern() {
    // Test rendering a simple splash screen pattern
    let config = ScreenDimensionsConfig::new(320, 240);
    let mut fb = GpuFramebuffer::new(&config);

    // Clear to black first
    fb.clear(0xFF000000);

    // Draw a white rectangle in the center (simulating a logo placeholder)
    let rect_x = 110;
    let rect_y = 95;
    let rect_w = 100;
    let rect_h = 50;
    let white = 0xFFFFFFFF;

    for y in rect_y..(rect_y + rect_h) {
        for x in rect_x..(rect_x + rect_w) {
            fb.put_pixel(x, y, white);
        }
    }

    // Verify the rectangle corners are white
    assert_eq!(fb.get_pixel(rect_x, rect_y), white, "Top-left of rect should be white");
    assert_eq!(fb.get_pixel(rect_x + rect_w - 1, rect_y), white, "Top-right of rect should be white");
    assert_eq!(fb.get_pixel(rect_x, rect_y + rect_h - 1), white, "Bottom-left of rect should be white");
    assert_eq!(fb.get_pixel(rect_x + rect_w - 1, rect_y + rect_h - 1), white, "Bottom-right of rect should be white");

    // Verify area outside rectangle is still black
    assert_eq!(fb.get_pixel(0, 0), 0xFF000000, "Top-left corner should be black");
    assert_eq!(fb.get_pixel(319, 239), 0xFF000000, "Bottom-right corner should be black");
}
