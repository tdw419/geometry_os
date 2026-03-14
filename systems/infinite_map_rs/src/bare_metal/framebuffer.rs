//! GPU Framebuffer Abstraction
//!
//! Provides a software framebuffer for bare metal rendering.
//! This is used for GPU scanout and pixel manipulation.

use super::ScreenDimensionsConfig;

/// Framebuffer pixel format
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum FramebufferFormat {
    /// ARGB with 8 bits per channel (32-bit total)
    ARGB8888 = 0x34325241,
    /// RGBA with 8 bits per channel (32-bit total)
    RGBA8888 = 0x34325242,
}

/// GPU Framebuffer for bare metal rendering
///
/// Represents a linear framebuffer in memory that can be
/// rendered to and eventually scanned out to the display.
#[derive(Debug, Clone)]
pub struct GpuFramebuffer {
    width: u32,
    height: u32,
    format: FramebufferFormat,
    buffer: Vec<u32>,
}

impl GpuFramebuffer {
    /// Create a new framebuffer with the given dimensions
    pub fn new(config: &ScreenDimensionsConfig) -> Self {
        let size = (config.width * config.height) as usize;
        Self {
            width: config.width,
            height: config.height,
            format: FramebufferFormat::ARGB8888,
            buffer: vec![0u32; size],
        }
    }

    /// Get the framebuffer width
    pub fn width(&self) -> u32 {
        self.width
    }

    /// Get the framebuffer height
    pub fn height(&self) -> u32 {
        self.height
    }

    /// Get the buffer length (total pixels)
    pub fn buffer_len(&self) -> usize {
        self.buffer.len()
    }

    /// Get the framebuffer format
    pub fn format(&self) -> FramebufferFormat {
        self.format
    }

    /// Put a pixel at the given coordinates
    ///
    /// If coordinates are out of bounds, this is a no-op.
    pub fn put_pixel(&mut self, x: u32, y: u32, color: u32) {
        if x >= self.width || y >= self.height {
            return;
        }
        let idx = (y * self.width + x) as usize;
        self.buffer[idx] = color;
    }

    /// Get a pixel at the given coordinates
    ///
    /// Returns 0 if coordinates are out of bounds.
    pub fn get_pixel(&self, x: u32, y: u32) -> u32 {
        if x >= self.width || y >= self.height {
            return 0;
        }
        let idx = (y * self.width + x) as usize;
        self.buffer[idx]
    }

    /// Clear the framebuffer to a solid color
    pub fn clear(&mut self, color: u32) {
        for pixel in self.buffer.iter_mut() {
            *pixel = color;
        }
    }

    /// Get a reference to the raw buffer
    pub fn buffer(&self) -> &[u32] {
        &self.buffer
    }

    /// Get a mutable reference to the raw buffer
    pub fn buffer_mut(&mut self) -> &mut [u32] {
        &mut self.buffer
    }
}
