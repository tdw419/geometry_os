//! ACE Binary Extractor
//!
//! Extracts ACE binary logic from .rts.png textures using Hilbert curve mapping.
//! This reverses the serialization process performed by ace_to_rts.py.
//!
//! # Architecture
//!
//! The .rts.png file contains the ACE binary encoded in RGBA pixels using a Hilbert curve:
//! - 4 bytes per pixel (RGBA)
//! - Binary data mapped sequentially along Hilbert curve
//! - Layer-specific regions for different components
//!
//! # Usage
//!
//! ```rust
//! use crate::cognitive::binary_extractor::ACEBinaryExtractor;
//!
//! let extractor = ACEBinaryExtractor::new();
//! let binary = extractor.extract_from_texture("ace.rts.png").unwrap?;
//! ```

use anyhow::{Context, Result};
use image::{DynamicImage, ImageBuffer, Rgba};
use std::path::Path;

/// ACE Binary Extractor
///
/// Extracts executable binary code from .rts.png textures using Hilbert curve
/// mapping. This reverses the serialization performed by ace_to_rts.py.
pub struct ACEBinaryExtractor {
    /// Grid size (must be power of 2)
    grid_size: u32,
    /// Hilbert curve order (log2 of grid_size)
    order: u32,
    /// Total pixels in the grid
    total_pixels: u32,
}

impl ACEBinaryExtractor {
    /// Create a new ACE binary extractor
    ///
    /// # Arguments
    ///
    /// * `grid_size` - Size of the grid (must be power of 2, default 512)
    pub fn new(grid_size: u32) -> Self {
        assert!(grid_size.is_power_of_two(), "Grid size must be power of 2");
        
        let order = grid_size.trailing_zeros();
        let total_pixels = grid_size * grid_size;
        
        Self {
            grid_size,
            order,
            total_pixels,
        }
    }
    
    /// Create extractor with default grid size (512)
    pub fn default() -> Self {
        Self::new(512)
    }
    
    /// Extract ACE binary from texture file
    ///
    /// # Arguments
    ///
    /// * `texture_path` - Path to the .rts.png file
    ///
    /// # Returns
    ///
    /// The extracted binary data
    pub fn extract_from_texture<P: AsRef<Path>>(&self, texture_path: P) -> Result<Vec<u8>> {
        let texture_path = texture_path.as_ref();
        
        log::info!("Loading ACE texture: {:?}", texture_path);
        
        // Load the image
        let img = image::open(texture_path)
            .context("Failed to open texture file")?;
        
        // Extract binary from image data
        self.extract_from_image(&img)
    }
    
    /// Extract ACE binary from image data
    ///
    /// # Arguments
    ///
    /// * `img` - The image to extract from
    ///
    /// # Returns
    ///
    /// The extracted binary data
    pub fn extract_from_image(&self, img: &DynamicImage) -> Result<Vec<u8>> {
        // Convert to RGBA8
        let rgba_img = img.to_rgba8();
        
        let width = rgba_img.width();
        let height = rgba_img.height();
        
        log::info!("Texture size: {}×{}", width, height);
        
        if width != height || width != self.grid_size {
            anyhow::bail!(
                "Unexpected texture size: expected {}×{}, got {}×{}",
                self.grid_size, self.grid_size, width, height
            );
        }
        
        // Generate Hilbert LUT
        let lut = self.generate_hilbert_lut();
        
        // Extract bytes from pixels along Hilbert curve
        let mut binary_data = Vec::with_capacity((self.total_pixels * 4) as usize);
        
        for pixel_idx in 0..self.total_pixels {
            let (x, y) = lut[pixel_idx as usize];
            
            if x >= width || y >= height {
                anyhow::bail!("Invalid Hilbert coordinates: ({}, {})", x, y);
            }
            
            let pixel = rgba_img.get_pixel(x, y);
            
            // Extract RGBA bytes
            binary_data.push(pixel[0]); // R
            binary_data.push(pixel[1]); // G
            binary_data.push(pixel[2]); // B
            binary_data.push(pixel[3]); // A
        }
        
        // Remove trailing zeros (padding)
        let trimmed_data = self.trim_padding(&binary_data);
        
        log::info!(
            "Extracted {} bytes ({} pixels along Hilbert curve)",
            trimmed_data.len(),
            self.total_pixels
        );
        
        Ok(trimmed_data)
    }
    
    /// Extract specific layer region from texture
    ///
    /// # Arguments
    ///
    /// * `img` - The image to extract from
    /// * `layer_id` - Layer ID (0-5)
    ///
    /// # Returns
    ///
    /// The extracted binary data for that layer
    pub fn extract_layer_region(
        &self,
        img: &DynamicImage,
        layer_id: u32,
    ) -> Result<Vec<u8>> {
        if layer_id > 5 {
            anyhow::bail!("Invalid layer ID: {}", layer_id);
        }
        
        // Define layer regions (must match serializer)
        let layer_regions = [
            (0.00, 0.05), // Layer 0: Aspirational
            (0.05, 0.20), // Layer 1: Global Strategy
            (0.20, 0.35), // Layer 2: Agent Model
            (0.35, 0.55), // Layer 3: Executive Function
            (0.55, 0.75), // Layer 4: Cognitive Control
            (0.75, 1.00), // Layer 5: Task Prosecution
        ];
        
        let (start_pct, end_pct) = layer_regions[layer_id as usize];
        let start = (self.total_pixels as f64 * start_pct) as u32;
        let end = (self.total_pixels as f64 * end_pct) as u32;
        
        log::info!(
            "Extracting layer {}: pixels {}-{}",
            layer_id,
            start,
            end
        );
        
        // Convert to RGBA8
        let rgba_img = img.to_rgba8();
        
        // Generate Hilbert LUT
        let lut = self.generate_hilbert_lut();
        
        // Extract bytes from layer region
        let mut layer_data = Vec::with_capacity(((end - start) * 4) as usize);
        
        for pixel_idx in start..end {
            if pixel_idx >= self.total_pixels {
                break;
            }
            
            let (x, y) = lut[pixel_idx as usize];
            let pixel = rgba_img.get_pixel(x, y);
            
            layer_data.push(pixel[0]); // R
            layer_data.push(pixel[1]); // G
            layer_data.push(pixel[2]); // B
            layer_data.push(pixel[3]); // A
        }
        
        log::info!(
            "Extracted {} bytes for layer {}",
            layer_data.len(),
            layer_id
        );
        
        Ok(layer_data)
    }
    
    /// Extract diagnostics block from texture
    ///
    /// # Arguments
    ///
    /// * `img` - The image to extract from
    ///
    /// # Returns
    ///
    /// The diagnostics data (64×64 block in upper-right)
    pub fn extract_diagnostics(&self, img: &DynamicImage) -> Result<Vec<u8>> {
        let rgba_img = img.to_rgba8();
        
        // Diagnostic block location (upper-right corner)
        let diag_block_start = (self.total_pixels as f64 * 0.98) as u32;
        let diag_block_size = 64 * 64;
        
        log::info!(
            "Extracting diagnostics: pixels {}-{}",
            diag_block_start,
            diag_block_start + diag_block_size
        );
        
        // Generate Hilbert LUT
        let lut = self.generate_hilbert_lut();
        
        // Extract diagnostics block
        let mut diag_data = Vec::with_capacity((diag_block_size * 4) as usize);
        
        for i in 0..diag_block_size {
            let pixel_idx = diag_block_start + i;
            if pixel_idx >= self.total_pixels {
                break;
            }
            
            let (x, y) = lut[pixel_idx as usize];
            let pixel = rgba_img.get_pixel(x, y);
            
            diag_data.push(pixel[0]); // R
            diag_data.push(pixel[1]); // G
            diag_data.push(pixel[2]); // B
            diag_data.push(pixel[3]); // A
        }
        
        log::info!("Extracted {} bytes for diagnostics", diag_data.len());
        
        Ok(diag_data)
    }
    
    /// Generate Hilbert curve lookup table
    ///
    /// Returns a mapping from distance d to (x, y) coordinates
    fn generate_hilbert_lut(&self) -> Vec<(u32, u32)> {
        let n = self.grid_size;
        let total = (n * n) as usize;
        let mut lut = Vec::with_capacity(total);
        
        for d in 0..total {
            let (x, y) = self.hilbert_d2xy(n, d as u64);
            lut.push((x, y));
        }
        
        lut
    }
    
    /// Convert Hilbert distance to (x, y) coordinates
    ///
    /// # Arguments
    ///
    /// * `n` - Grid size (must be power of 2)
    /// * `d` - Distance along Hilbert curve
    ///
    /// # Returns
    ///
    /// (x, y) coordinates
    fn hilbert_d2xy(&self, n: u32, d: u64) -> (u32, u32) {
        let mut x = 0u32;
        let mut y = 0u32;
        let mut s = 1u32;
        let mut d = d;
        
        while s < n {
            let rx = 1 & (d / 2);
            let ry = 1 & (d ^ rx);
            
            if ry == 0 {
                if rx == 1 {
                    x = s - 1 - x;
                    y = s - 1 - y;
                }
                // Swap x and y
                std::mem::swap(&mut x, &mut y);
            }
            
            x += s * (rx as u32);
            y += s * (ry as u32);
            
            d /= 4;
            s *= 2;
        }
        
        (x, y)
    }
    
    /// Trim trailing zeros (padding) from binary data
    ///
    /// The serializer pads the data to fill the grid, so we need to remove
    /// the trailing zeros to get the actual binary size.
    fn trim_padding(&self, data: &[u8]) -> Vec<u8> {
        // Find the last non-zero byte
        let last_non_zero = data.iter().rposition(|&b| b != 0);
        
        match last_non_zero {
            Some(pos) => data[..=pos].to_vec(),
            None => Vec::new(), // All zeros
        }
    }
    
    /// Validate extracted binary data
    ///
    /// # Arguments
    ///
    /// * `data` - The binary data to validate
    ///
    /// # Returns
    ///
    /// Ok(()) if valid, Err otherwise
    pub fn validate_binary(&self, data: &[u8]) -> Result<()> {
        if data.is_empty() {
            anyhow::bail!("Extracted binary is empty");
        }
        
        // Check for WASM magic number (if it's a WASM binary)
        if data.len() >= 4 {
            let magic = &data[0..4];
            if magic == b"\0asm" {
                log::info!("Detected WASM binary");
                return Ok(());
            }
            
            // Check for ELF magic number (if it's a native binary)
            if magic == b"\x7fELF" {
                log::info!("Detected ELF binary");
                return Ok(());
            }
        }
        
        // If no magic number detected, still accept it
        // (might be a custom format or embedded data)
        log::warn!("No known magic number detected, accepting anyway");
        
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_hilbert_d2xy() {
        let extractor = ACEBinaryExtractor::new(4);
        
        // Test a few known points
        let (x, y) = extractor.hilbert_d2xy(4, 0);
        assert_eq!(x, 0);
        assert_eq!(y, 0);
        
        let (x, y) = extractor.hilbert_d2xy(4, 1);
        assert_eq!(x, 1);
        assert_eq!(y, 0);
        
        let (x, y) = extractor.hilbert_d2xy(4, 2);
        assert_eq!(x, 1);
        assert_eq!(y, 1);
    }
    
    #[test]
    fn test_trim_padding() {
        let extractor = ACEBinaryExtractor::default();
        
        let data = vec![1, 2, 3, 0, 0, 0];
        let trimmed = extractor.trim_padding(&data);
        assert_eq!(trimmed, vec![1, 2, 3]);
        
        let data = vec![0, 0, 0];
        let trimmed = extractor.trim_padding(&data);
        assert_eq!(trimmed, Vec::<u8>::new()); // All zeros returns empty vec
    }
}
