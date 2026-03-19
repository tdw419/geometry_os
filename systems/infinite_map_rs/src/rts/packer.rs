//! RTS Packer - Pack data into .rts.png format
//!
//! Provides functionality to encode arbitrary data into .rts.png files
//! using PNG tEXt chunks and other encoding strategies.
//!
//! # Encoding Strategies
//!
//! 1. **PNG tEXt chunks**: Store data in metadata chunks (primary)
//! 2. **Alpha channel encoding**: Encode in pixel alpha values (planned)
//! 3. **Hilbert curve encoding**: Spatial distribution (planned)
//!
//! # Example
//!
//! ```rust,ignore
//! use infinite_map_rs::rts::packer::{RTSPacker, PackOptions};
//!
//! let packer = RTSPacker::new();
//! let data = b"Hello, RTS!";
//! let rts_png = packer.pack_bytes(data);
//! std::fs::write("output.rts.png", &rts_png)?;
//! ```

use image::{ImageBuffer, Rgba, RgbaImage};
use png::text_metadata::TEXtChunk;
use png::Encoder;
use std::io::Cursor;

/// Options for packing data into .rts.png format
#[derive(Debug, Clone)]
pub struct PackOptions {
    /// Data type identifier (e.g., "wgsl-shader", "binary", "bytecode")
    pub data_type: String,
    /// Width of the output PNG (default: 256)
    pub width: u32,
    /// Height of the output PNG (default: 256)
    pub height: u32,
    /// Enable alpha channel encoding (planned)
    pub use_alpha_encoding: bool,
    /// Enable Hilbert curve encoding (planned)
    pub use_hilbert_encoding: bool,
}

impl Default for PackOptions {
    fn default() -> Self {
        Self {
            data_type: "binary".to_string(),
            width: 256,
            height: 256,
            use_alpha_encoding: false,
            use_hilbert_encoding: false,
        }
    }
}

/// RTS Packer - Encodes data into .rts.png format
pub struct RTSPacker {
    options: PackOptions,
}

impl RTSPacker {
    /// Create a new packer with default options
    pub fn new() -> Self {
        Self {
            options: PackOptions::default(),
        }
    }

    /// Create a packer with custom options
    pub fn with_options(options: PackOptions) -> Self {
        Self { options }
    }

    /// Pack bytes into .rts.png format
    ///
    /// Creates a PNG file with:
    /// - tEXt chunk containing the data type
    /// - tEXt chunk containing the base64-encoded data
    /// - Pixel image with optional alpha channel encoding
    ///
    /// # Arguments
    ///
    /// * `data` - The bytes to pack
    ///
    /// # Returns
    ///
    /// Raw PNG bytes ready to write to file
    pub fn pack_bytes(&self, data: &[u8]) -> Vec<u8> {
        log::debug!("Packing {} bytes into .rts.png format", data.len());

        // Create PNG image
        let mut img: RgbaImage = ImageBuffer::new(self.options.width, self.options.height);

        // Fill with blue-purple WGSL indicator color
        // R=64 (< 100), B=128 (> 150) - matches is_wgsl_color() check
        for (x, y, pixel) in img.enumerate_pixels_mut() {
            *pixel = Rgba([64, 32, 180, 255]);
        }

        // Encode data into alpha channel if enabled
        if self.options.use_alpha_encoding {
            self.encode_alpha_channel(&mut img, data);
        }

        // Encode to PNG with tEXt chunks
        let mut output = Cursor::new(Vec::new());
        {
            let mut encoder = Encoder::new(&mut output, self.options.width, self.options.height);
            encoder.set_color(png::ColorType::Rgba);
            encoder.set_depth(png::BitDepth::Eight);

            // Add metadata tEXt chunks
            let mut writer = encoder.write_header().expect("Failed to write PNG header");

            // Write data type chunk
            let type_chunk = TEXtChunk {
                keyword: "type".to_string(),
                text: self.options.data_type.clone(),
            };
            writer
                .write_text_chunk(&type_chunk)
                .expect("Failed to write type chunk");

            // Write data chunk (base64 encoded to ensure valid UTF-8)
            let encoded_data = base64_encode(data);
            let data_chunk = TEXtChunk {
                keyword: "data".to_string(),
                text: encoded_data,
            };
            writer
                .write_text_chunk(&data_chunk)
                .expect("Failed to write data chunk");

            // Write alpha encoding marker if enabled
            if self.options.use_alpha_encoding {
                let alpha_chunk = TEXtChunk {
                    keyword: "alpha_encoding".to_string(),
                    text: format!(
                        "{}_{}",
                        data.len(),
                        if self.options.use_hilbert_encoding {
                            "hilbert"
                        } else {
                            "linear"
                        }
                    ),
                };
                writer
                    .write_text_chunk(&alpha_chunk)
                    .expect("Failed to write alpha chunk");
            }

            // Write the image data
            writer
                .write_image_data(&img.into_raw())
                .expect("Failed to write image data");
        }

        output.into_inner()
    }

    /// Encode data into the alpha channel of the image
    ///
    /// Uses blue-purple RGB (64, 32, 180) as indicator, alpha = data byte
    /// Supports both linear and Hilbert curve spatial ordering
    fn encode_alpha_channel(&self, img: &mut RgbaImage, data: &[u8]) {
        let width = img.width();
        let height = img.height();
        let total_pixels = (width * height) as usize;

        log::debug!(
            "Encoding {} bytes into alpha channel of {}x{} image ({} pixels)",
            data.len(),
            width,
            height,
            total_pixels
        );

        if self.options.use_hilbert_encoding {
            // Use Hilbert curve ordering for spatial distribution
            let grid_size = width.min(height);
            if grid_size.is_power_of_two() {
                self.encode_alpha_hilbert(img, data, grid_size);
            } else {
                log::warn!(
                    "Grid size {} not power of 2, falling back to linear encoding",
                    grid_size
                );
                self.encode_alpha_linear(img, data);
            }
        } else {
            // Linear encoding
            self.encode_alpha_linear(img, data);
        }
    }

    /// Encode data into alpha channel using linear (row-major) ordering
    fn encode_alpha_linear(&self, img: &mut RgbaImage, data: &[u8]) {
        let width = img.width();
        let height = img.height();

        for (idx, &byte) in data.iter().enumerate() {
            let x = (idx % width as usize) as u32;
            let y = (idx / width as usize) as u32;

            if y >= height {
                log::warn!("Data exceeds image capacity, truncating at {} bytes", idx);
                break;
            }

            let pixel = img.get_pixel_mut(x, y);
            pixel[3] = byte; // Set alpha = data byte
        }
    }

    /// Encode data into alpha channel using Hilbert curve ordering
    fn encode_alpha_hilbert(&self, img: &mut RgbaImage, data: &[u8], grid_size: u32) {
        for (d, &byte) in data.iter().enumerate() {
            let (x, y) = hilbert_d2xy(grid_size, d as u64);

            if x >= img.width() || y >= img.height() {
                log::warn!(
                    "Hilbert coordinate ({}, {}) out of bounds, truncating at byte {}",
                    x,
                    y,
                    d
                );
                break;
            }

            let pixel = img.get_pixel_mut(x, y);
            pixel[3] = byte; // Set alpha = data byte
        }
    }

    /// Pack bytes with a specific data type
    pub fn pack_bytes_as(&self, data: &[u8], data_type: &str) -> Vec<u8> {
        let mut options = self.options.clone();
        options.data_type = data_type.to_string();
        let packer = Self::with_options(options);
        packer.pack_bytes(data)
    }
}

impl Default for RTSPacker {
    fn default() -> Self {
        Self::new()
    }
}

/// Simple base64 encoding (no external dependency for minimal footprint)
fn base64_encode(data: &[u8]) -> String {
    const ALPHABET: &[u8] = b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    let mut result = String::with_capacity((data.len() + 2) / 3 * 4);

    for chunk in data.chunks(3) {
        let b0 = chunk[0] as usize;
        let b1 = chunk.get(1).copied().unwrap_or(0) as usize;
        let b2 = chunk.get(2).copied().unwrap_or(0) as usize;

        result.push(ALPHABET[b0 >> 2] as char);
        result.push(ALPHABET[((b0 & 0x03) << 4) | (b1 >> 4)] as char);

        if chunk.len() > 1 {
            result.push(ALPHABET[((b1 & 0x0f) << 2) | (b2 >> 6)] as char);
        } else {
            result.push('=');
        }

        if chunk.len() > 2 {
            result.push(ALPHABET[b2 & 0x3f] as char);
        } else {
            result.push('=');
        }
    }

    result
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
fn hilbert_d2xy(n: u32, d: u64) -> (u32, u32) {
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

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_packer_creates_valid_png() {
        let packer = RTSPacker::new();
        let data = b"Hello, RTS!";
        let png_data = packer.pack_bytes(data);

        // Verify PNG magic bytes
        assert_eq!(&png_data[0..8], &[137, 80, 78, 71, 13, 10, 26, 10]);
    }

    #[test]
    fn test_base64_encode() {
        assert_eq!(base64_encode(b"Hello"), "SGVsbG8=");
        assert_eq!(base64_encode(b"Hello, RTS!"), "SGVsbG8sIFJUUyE=");
    }

    #[test]
    fn test_pack_options_default() {
        let opts = PackOptions::default();
        assert_eq!(opts.data_type, "binary");
        assert_eq!(opts.width, 256);
        assert_eq!(opts.height, 256);
    }

    #[test]
    fn test_alpha_encoding_linear() {
        let opts = PackOptions {
            use_alpha_encoding: true,
            use_hilbert_encoding: false,
            width: 16,
            height: 16,
            ..Default::default()
        };
        let packer = RTSPacker::with_options(opts);
        let data = b"Hello!";
        let png_data = packer.pack_bytes(data);

        // Verify PNG magic bytes
        assert_eq!(&png_data[0..8], &[137, 80, 78, 71, 13, 10, 26, 10]);

        // Load the image and verify alpha channel contains data
        let img = image::load_from_memory(&png_data).expect("Should load PNG");
        let rgba = img.to_rgba8();

        // First 6 pixels should have alpha values = 'H', 'e', 'l', 'l', 'o', '!'
        assert_eq!(rgba.get_pixel(0, 0)[3], b'H');
        assert_eq!(rgba.get_pixel(1, 0)[3], b'e');
        assert_eq!(rgba.get_pixel(2, 0)[3], b'l');
        assert_eq!(rgba.get_pixel(3, 0)[3], b'l');
        assert_eq!(rgba.get_pixel(4, 0)[3], b'o');
        assert_eq!(rgba.get_pixel(5, 0)[3], b'!');

        // Verify RGB is blue-purple WGSL indicator
        let pixel = rgba.get_pixel(0, 0);
        assert_eq!(pixel[0], 64); // R
        assert_eq!(pixel[1], 32); // G
        assert_eq!(pixel[2], 180); // B
    }

    #[test]
    fn test_alpha_encoding_hilbert() {
        let opts = PackOptions {
            use_alpha_encoding: true,
            use_hilbert_encoding: true,
            width: 4,
            height: 4,
            ..Default::default()
        };
        let packer = RTSPacker::with_options(opts);
        let data = b"ABCD";
        let png_data = packer.pack_bytes(data);

        // Verify PNG magic bytes
        assert_eq!(&png_data[0..8], &[137, 80, 78, 71, 13, 10, 26, 10]);

        // Load the image
        let img = image::load_from_memory(&png_data).expect("Should load PNG");
        let rgba = img.to_rgba8();

        // Hilbert curve on 4x4 (actual positions from algorithm):
        // d=0 -> (0,0), d=1 -> (1,0), d=2 -> (1,1), d=3 -> (0,1)
        assert_eq!(rgba.get_pixel(0, 0)[3], b'A'); // d=0
        assert_eq!(rgba.get_pixel(1, 0)[3], b'B'); // d=1
        assert_eq!(rgba.get_pixel(1, 1)[3], b'C'); // d=2
        assert_eq!(rgba.get_pixel(0, 1)[3], b'D'); // d=3
    }

    #[test]
    fn test_hilbert_d2xy() {
        // Test known Hilbert curve points on 4x4 grid
        // These are the actual values from the algorithm
        assert_eq!(hilbert_d2xy(4, 0), (0, 0));
        assert_eq!(hilbert_d2xy(4, 1), (1, 0));
        assert_eq!(hilbert_d2xy(4, 2), (1, 1));
        assert_eq!(hilbert_d2xy(4, 3), (0, 1));
        assert_eq!(hilbert_d2xy(4, 4), (0, 2));
        assert_eq!(hilbert_d2xy(4, 5), (0, 3)); // Actual value
        assert_eq!(hilbert_d2xy(4, 6), (1, 3));
        assert_eq!(hilbert_d2xy(4, 7), (1, 2));
    }
}
