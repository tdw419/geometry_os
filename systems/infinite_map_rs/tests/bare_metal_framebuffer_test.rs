//! Tests for GPU Framebuffer Abstraction
//!
//! Task 2 of Phase 4: Bare Metal Boot

use infinite_map_rs::bare_metal::{GpuFramebuffer, ScreenDimensionsConfig};

#[test]
fn test_framebuffer_creation() {
    let config = ScreenDimensionsConfig::new(800, 600);
    let fb = GpuFramebuffer::new(&config);

    assert_eq!(fb.width(), 800);
    assert_eq!(fb.height(), 600);
    assert_eq!(fb.buffer_len(), 800 * 600);
}

#[test]
fn test_framebuffer_put_pixel() {
    let config = ScreenDimensionsConfig::new(100, 100);
    let mut fb = GpuFramebuffer::new(&config);

    fb.put_pixel(10, 20, 0xFF0000FF);
    assert_eq!(fb.get_pixel(10, 20), 0xFF0000FF);
}

#[test]
fn test_framebuffer_get_pixel_out_of_bounds() {
    let config = ScreenDimensionsConfig::new(100, 100);
    let fb = GpuFramebuffer::new(&config);

    // Out of bounds should return 0
    assert_eq!(fb.get_pixel(200, 200), 0);
}

#[test]
fn test_framebuffer_put_pixel_out_of_bounds() {
    let config = ScreenDimensionsConfig::new(100, 100);
    let mut fb = GpuFramebuffer::new(&config);

    // This should not panic, just be ignored
    fb.put_pixel(200, 200, 0xFF0000FF);
}

#[test]
fn test_framebuffer_clear() {
    let config = ScreenDimensionsConfig::new(10, 10);
    let mut fb = GpuFramebuffer::new(&config);

    // Clear to a specific color
    fb.clear(0xDEADBEEF);

    // All pixels should be the clear color
    for y in 0..10 {
        for x in 0..10 {
            assert_eq!(fb.get_pixel(x, y), 0xDEADBEEF);
        }
    }
}

#[test]
fn test_framebuffer_default_format() {
    let config = ScreenDimensionsConfig::default();
    let fb = GpuFramebuffer::new(&config);

    // Default format should be ARGB8888
    assert!(matches!(fb.format(), infinite_map_rs::bare_metal::FramebufferFormat::ARGB8888));
}
