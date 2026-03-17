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

use anyhow::Result;
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
    /// - Minimal pixel image for valid PNG structure
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

        // Create a minimal valid PNG image
        let mut img: RgbaImage = ImageBuffer::new(self.options.width, self.options.height);

        // Fill with a subtle pattern to indicate RTS format
        for (x, y, pixel) in img.enumerate_pixels_mut() {
            // Blue-purple color scheme to match WGSL indicator
            *pixel = Rgba([64, 32, 128, 255]);
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
            writer.write_text_chunk(&type_chunk).expect("Failed to write type chunk");

            // Write data chunk (base64 encoded to ensure valid UTF-8)
            let encoded_data = base64_encode(data);
            let data_chunk = TEXtChunk {
                keyword: "data".to_string(),
                text: encoded_data,
            };
            writer.write_text_chunk(&data_chunk).expect("Failed to write data chunk");

            // Write the image data
            writer.write_image_data(&img.into_raw()).expect("Failed to write image data");
        }

        output.into_inner()
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
}
