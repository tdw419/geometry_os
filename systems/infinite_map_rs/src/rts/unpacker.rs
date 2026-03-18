//! RTS Unpacker - Extract data from .rts.png format
//!
//! Provides functionality to decode data from .rts.png files
//! by reading PNG tEXt chunks and optionally extracting alpha channel data.
//!
//! # Example
//!
//! ```rust,ignore
//! use infinite_map_rs::rts::unpacker::{RTSUnpacker, UnpackOptions};
//!
//! let rts_data = std::fs::read("bundle.rts.png")?;
//! let unpacker = RTSUnpacker::new(&rts_data);
//! let recovered = unpacker.unpack_all()?;
//! ```

use anyhow::{anyhow, Result};
use image::{ImageBuffer, RgbaImage};
use png::Decoder;
use std::io::Cursor;

/// Options for unpacking data from .rts.png format
#[derive(Debug, Clone, Default)]
pub struct UnpackOptions {
    /// Extract from alpha channel if present
    pub extract_alpha: bool,
    /// Use Hilbert curve ordering for alpha extraction
    pub use_hilbert_encoding: bool,
    /// Validate data length against alpha_encoding chunk
    pub validate_length: bool,
}

/// Metadata extracted from .rts.png file
#[derive(Debug, Clone)]
pub struct RtsMetadata {
    /// Data type identifier (e.g., "wgsl-shader", "binary", "bytecode")
    pub data_type: Option<String>,
    /// Alpha encoding info: (data_length, encoding_mode)
    pub alpha_encoding: Option<(usize, String)>,
}

/// RTS Unpacker - Decodes data from .rts.png format
pub struct RTSUnpacker<'a> {
    data: &'a [u8],
    options: UnpackOptions,
    metadata: RtsMetadata,
    image: Option<RgbaImage>,
}

impl<'a> RTSUnpacker<'a> {
    /// Create a new unpacker from .rts.png bytes
    pub fn new(data: &'a [u8]) -> Self {
        Self {
            data,
            options: UnpackOptions::default(),
            metadata: RtsMetadata {
                data_type: None,
                alpha_encoding: None,
            },
            image: None,
        }
    }

    /// Create an unpacker with custom options
    pub fn with_options(data: &'a [u8], options: UnpackOptions) -> Self {
        Self {
            data,
            options,
            metadata: RtsMetadata {
                data_type: None,
                alpha_encoding: None,
            },
            image: None,
        }
    }

    /// Extract metadata and image from PNG
    fn parse_png(&mut self) -> Result<()> {
        let cursor = Cursor::new(self.data);
        let mut decoder = Decoder::new(cursor);

        // Don't ignore text chunks (read them by default)
        decoder.set_ignore_text_chunk(false);

        let mut reader = decoder.read_info()?;

        // Extract metadata from info first (before next_frame)
        let (width, height, needs_alpha_extraction) = {
            let info = reader.info();

            // Extract tEXt chunks
            for text_chunk in &info.uncompressed_latin1_text {
                match text_chunk.keyword.as_str() {
                    "type" => {
                        self.metadata.data_type = Some(text_chunk.text.clone());
                    },
                    "alpha_encoding" => {
                        // Parse format: "{len}_{mode}"
                        let parts: Vec<&str> = text_chunk.text.split('_').collect();
                        if parts.len() == 2 {
                            if let Ok(len) = parts[0].parse::<usize>() {
                                self.metadata.alpha_encoding = Some((len, parts[1].to_string()));
                            }
                        }
                    },
                    _ => {},
                }
            }

            let needs_alpha = self.options.extract_alpha || self.metadata.alpha_encoding.is_some();
            (info.width, info.height, needs_alpha)
        };

        // Decode image for alpha extraction
        if needs_alpha_extraction {
            let mut img_data = vec![0u8; reader.output_buffer_size()];
            reader.next_frame(&mut img_data)?;

            // Convert to RgbaImage
            if let Some(img) = ImageBuffer::from_raw(width, height, img_data) {
                self.image = Some(img);
            }
        }

        Ok(())
    }

    /// Unpack all data from the .rts.png file
    ///
    /// Priority order:
    /// 1. Alpha channel data (if alpha_encoding chunk present and extract_alpha=true)
    /// 2. tEXt "data" chunk (base64 decoded)
    ///
    /// # Returns
    ///
    /// Recovered bytes
    pub fn unpack_all(&mut self) -> Result<Vec<u8>> {
        self.parse_png()?;

        // Try alpha channel extraction first if enabled
        if self.options.extract_alpha || self.metadata.alpha_encoding.is_some() {
            if let Some(ref image) = self.image {
                if let Some((len, mode)) = &self.metadata.alpha_encoding {
                    let data = if mode == "hilbert" {
                        self.extract_alpha_hilbert(image, *len)?
                    } else {
                        self.extract_alpha_linear(image, *len)?
                    };

                    if self.options.validate_length && data.len() != *len {
                        return Err(anyhow!(
                            "Length mismatch: expected {}, got {}",
                            len,
                            data.len()
                        ));
                    }

                    return Ok(data);
                }
            }
        }

        // Fall back to tEXt chunk extraction
        self.unpack_from_text_chunk()
    }

    /// Extract data from tEXt "data" chunk (base64 decoded)
    fn unpack_from_text_chunk(&self) -> Result<Vec<u8>> {
        let cursor = Cursor::new(self.data);
        let mut decoder = Decoder::new(cursor);
        decoder.set_ignore_text_chunk(false);

        let mut reader = decoder.read_info()?;
        let info = reader.info();

        for text_chunk in &info.uncompressed_latin1_text {
            if text_chunk.keyword == "data" {
                return base64_decode(&text_chunk.text);
            }
        }

        Err(anyhow!("No 'data' tEXt chunk found in .rts.png"))
    }

    /// Extract data from alpha channel using linear (row-major) ordering
    fn extract_alpha_linear(&self, img: &RgbaImage, len: usize) -> Result<Vec<u8>> {
        let width = img.width() as usize;
        let height = img.height() as usize;
        let total_pixels = width * height;

        if len > total_pixels {
            return Err(anyhow!(
                "Data length {} exceeds image capacity {}",
                len,
                total_pixels
            ));
        }

        let mut result = Vec::with_capacity(len);

        for idx in 0..len {
            let x = (idx % width) as u32;
            let y = (idx / width) as u32;

            if y as usize >= height {
                break;
            }

            let pixel = img.get_pixel(x, y);
            result.push(pixel[3]); // Alpha channel
        }

        Ok(result)
    }

    /// Extract data from alpha channel using Hilbert curve ordering
    fn extract_alpha_hilbert(&self, img: &RgbaImage, len: usize) -> Result<Vec<u8>> {
        let width = img.width();
        let height = img.height();
        let grid_size = width.min(height);

        if !grid_size.is_power_of_two() {
            return Err(anyhow!(
                "Grid size {} must be power of 2 for Hilbert decoding",
                grid_size
            ));
        }

        let mut result = Vec::with_capacity(len);

        for d in 0..len {
            let (x, y) = hilbert_d2xy(grid_size, d as u64);

            if x >= width || y >= height {
                return Err(anyhow!(
                    "Hilbert coordinate ({}, {}) out of bounds at index {}",
                    x,
                    y,
                    d
                ));
            }

            let pixel = img.get_pixel(x, y);
            result.push(pixel[3]); // Alpha channel
        }

        Ok(result)
    }

    /// Get the data type from metadata
    pub fn data_type(&self) -> Option<&str> {
        self.metadata.data_type.as_deref()
    }

    /// Check if alpha encoding is present
    pub fn has_alpha_encoding(&self) -> bool {
        self.metadata.alpha_encoding.is_some()
    }

    /// Get alpha encoding info
    pub fn alpha_encoding(&self) -> Option<&(usize, String)> {
        self.metadata.alpha_encoding.as_ref()
    }
}

/// Simple base64 decoding
fn base64_decode(input: &str) -> Result<Vec<u8>> {
    const DECODE_TABLE: [i8; 128] = [
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1,
        -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4,
        5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1,
        -1, -1, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45,
        46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1,
    ];

    let input = input.trim_end_matches('=');
    let mut result = Vec::with_capacity(input.len() * 3 / 4);

    let chars: Vec<u8> = input.bytes().collect();

    for chunk in chars.chunks(4) {
        if chunk.len() < 2 {
            break;
        }

        let v0 = DECODE_TABLE[(chunk[0] & 0x7F) as usize];
        let v1 = DECODE_TABLE[(chunk[1] & 0x7F) as usize];

        if v0 < 0 || v1 < 0 {
            return Err(anyhow!("Invalid base64 character"));
        }

        result.push(((v0 as u8) << 2) | ((v1 as u8) >> 4));

        if chunk.len() > 2 {
            let v2 = DECODE_TABLE[(chunk[2] & 0x7F) as usize];
            if v2 >= 0 {
                result.push(((v1 as u8) << 4) | ((v2 as u8) >> 2));

                if chunk.len() > 3 {
                    let v3 = DECODE_TABLE[(chunk[3] & 0x7F) as usize];
                    if v3 >= 0 {
                        result.push(((v2 as u8) << 6) | (v3 as u8));
                    }
                }
            }
        }
    }

    Ok(result)
}

/// Convert Hilbert distance to (x, y) coordinates
fn hilbert_d2xy(n: u32, d: u64) -> (u32, u32) {
    let mut x = 0u64;
    let mut y = 0u64;
    let mut s = 1u64;
    let mut d = d;

    while s < n as u64 {
        let rx = (d / 2) & 1;
        let ry = (d ^ rx) & 1;

        if ry == 0 {
            if rx == 1 {
                x = s - 1 - x;
                y = s - 1 - y;
            }
            std::mem::swap(&mut x, &mut y);
        }

        x += s * rx;
        y += s * ry;
        d /= 4;
        s *= 2;
    }

    (x as u32, y as u32)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::rts::packer::{PackOptions, RTSPacker};

    #[test]
    fn test_base64_decode() {
        // Standard test vectors
        assert_eq!(base64_decode("SGVsbG8=").unwrap(), b"Hello");
        assert_eq!(base64_decode("V29ybGQ=").unwrap(), b"World");
        assert_eq!(base64_decode("Zm9v").unwrap(), b"foo");
        assert_eq!(base64_decode("Zm9vYg==").unwrap(), b"foob");
        assert_eq!(base64_decode("Zm9vYmE=").unwrap(), b"fooba");
        assert_eq!(base64_decode("Zm9vYmFy").unwrap(), b"foobar");
    }

    #[test]
    fn test_hilbert_d2xy() {
        // 2x2 grid
        assert_eq!(hilbert_d2xy(2, 0), (0, 0));
        assert_eq!(hilbert_d2xy(2, 1), (0, 1));
        assert_eq!(hilbert_d2xy(2, 2), (1, 1));
        assert_eq!(hilbert_d2xy(2, 3), (1, 0));
    }

    #[test]
    fn test_unpack_from_text_chunk() {
        // Create a simple packed file
        let packer = RTSPacker::new();
        let test_data = b"Hello, RTS!";
        let packed = packer.pack_bytes(test_data);

        let unpacker = RTSUnpacker::new(&packed);
        let recovered = unpacker.unpack_from_text_chunk().unwrap();

        assert_eq!(recovered, test_data);
    }

    #[test]
    fn test_pack_unpack_roundtrip() {
        let test_data: Vec<u8> = (0..=255u8).cycle().take(1000).collect();

        // Pack
        let packer = RTSPacker::new();
        let packed = packer.pack_bytes(&test_data);

        // Unpack
        let mut unpacker = RTSUnpacker::new(&packed);
        let recovered = unpacker.unpack_all().unwrap();

        assert_eq!(recovered, test_data);
    }

    #[test]
    fn test_alpha_linear_roundtrip() {
        let test_data: Vec<u8> = (0..=255u8).cycle().take(100).collect();

        // Pack with alpha encoding
        let opts = PackOptions {
            data_type: "test".to_string(),
            width: 16,
            height: 16,
            use_alpha_encoding: true,
            use_hilbert_encoding: false,
        };
        let packer = RTSPacker::with_options(opts);
        let packed = packer.pack_bytes(&test_data);

        // Unpack
        let unpack_opts = UnpackOptions {
            extract_alpha: true,
            use_hilbert_encoding: false,
            validate_length: true,
        };
        let mut unpacker = RTSUnpacker::with_options(&packed, unpack_opts);
        let recovered = unpacker.unpack_all().unwrap();

        assert_eq!(recovered, test_data);
    }

    #[test]
    fn test_alpha_hilbert_roundtrip() {
        let test_data: Vec<u8> = (0..=255u8).cycle().take(256).collect();

        // Pack with Hilbert alpha encoding
        let opts = PackOptions {
            data_type: "test".to_string(),
            width: 16,
            height: 16,
            use_alpha_encoding: true,
            use_hilbert_encoding: true,
        };
        let packer = RTSPacker::with_options(opts);
        let packed = packer.pack_bytes(&test_data);

        // Unpack (auto-detects Hilbert from metadata)
        let unpack_opts = UnpackOptions {
            extract_alpha: true,
            use_hilbert_encoding: false, // Auto-detected from alpha_encoding chunk
            validate_length: true,
        };
        let mut unpacker = RTSUnpacker::with_options(&packed, unpack_opts);
        let recovered = unpacker.unpack_all().unwrap();

        assert_eq!(recovered, test_data);
    }
}
