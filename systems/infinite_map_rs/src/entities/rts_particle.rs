//! RTS Particle Entity for PixelRTS v2 Artifacts
//!
//! This module implements the RTSParticle entity, which represents a PixelRTS v2
//! artifact (like Linux kernels, initrds, or other binary data) that can be placed
//! on the infinite map as a draggable, executable particle.
//!
//! # PixelRTS v2 Format
//!
//! PixelRTS v2 files (.rts.png) contain:
//! - Binary data encoded via Hilbert space-filling curve
//! - RGBA dense packing (4 bytes per pixel)
//! - Metadata in PNG tEXt chunks with "PixelRTS" magic
//! - Optional sidecar .meta.json files for additional metadata
//!
//! # Example
//!
//! ```rust
//! use infinite_map_rs::entities::RTSParticle;
//! use glam::Vec2;
//!
//! let data = std::fs::read("ubuntu_kernel.rts.png")?;
//! let particle = RTSParticle::from_png(
//!     Vec2::new(100.0, 200.0),
//!     "ubuntu_kernel.rts.png",
//!     &data
//! )?;
//! ```

use crate::hilbert;
use anyhow::{anyhow, Result};
use glam::Vec2;
use image::DynamicImage;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;

/// PixelRTS v2 magic bytes for PNG tEXt chunk identification
pub const PIXELRTS_MAGIC: &[u8] = b"PixelRTS";

/// PixelRTS v2 Blueprint magic bytes
pub const PIXELRTS_BLUEPRINT_MAGIC: &[u8] = b"PixelRTS-Blueprint";

/// Encoding modes supported by PixelRTS v2
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum EncodingMode {
    /// Standard RGBA dense packing for binary data
    Standard,
    /// Code mode with visual semantics for WASM/binaries
    Code,
}

impl EncodingMode {
    /// Parse encoding mode from string
    pub fn from_str(s: &str) -> Result<Self> {
        match s.to_lowercase().as_str() {
            "standard" | "rgba-dense" => Ok(EncodingMode::Standard),
            "code" | "rgba-code" => Ok(EncodingMode::Code),
            _ => Err(anyhow!("Unknown encoding mode: {}", s)),
        }
    }

    /// Convert to string representation
    pub fn as_str(&self) -> &'static str {
        match self {
            EncodingMode::Standard => "RGBA-dense",
            EncodingMode::Code => "RGBA-code",
        }
    }
}

/// Metadata extracted from PixelRTS v2 file
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct RTSMetadata {
    /// Format version (e.g., 2 for PixelRTS v2)
    pub format_version: u32,
    /// Grid size (image dimension, must be power of 2)
    pub grid_size: u32,
    /// Encoding mode (Standard or Code)
    pub encoding_mode: EncodingMode,
    /// Bytes per pixel (always 4 for RGBA)
    pub bytes_per_pixel: u32,
    /// Type identifier (kernel, initrd, wasm, etc.)
    pub rts_type: Option<String>,
    /// Human-readable name
    pub name: Option<String>,
    /// Segment offsets (for multi-segment files)
    pub offsets: HashMap<String, SegmentInfo>,
    /// SHA256 hashes for integrity verification
    pub hashes: HashMap<String, String>,
    /// Original file size (uncompressed)
    pub original_size: Option<u64>,
    /// Timestamp when the file was created
    pub timestamp: Option<i64>,
}

/// Information about a segment within the PixelRTS file
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SegmentInfo {
    /// Offset in bytes from the start of decoded data
    pub offset: u64,
    /// Size in bytes
    pub size: u64,
    /// Segment type identifier
    pub segment_type: String,
}

impl Default for RTSMetadata {
    fn default() -> Self {
        Self {
            format_version: 2,
            grid_size: 512,
            encoding_mode: EncodingMode::Standard,
            bytes_per_pixel: 4,
            rts_type: None,
            name: None,
            offsets: HashMap::new(),
            hashes: HashMap::new(),
            original_size: None,
            timestamp: None,
        }
    }
}

/// RTS Particle - A PixelRTS v2 artifact on the infinite map
///
/// RTSParticles represent visual Linux kernels, initrds, WASM modules, or other
/// binary data encoded as PNG images. They can be dragged onto the map, previewed,
/// and executed.
#[derive(Debug, Clone)]
pub struct RTSParticle {
    /// Position on the infinite map
    pub position: Vec2,
    /// Original file name
    pub file_name: String,
    /// PNG image data (thumbnail)
    pub image: DynamicImage,
    /// Extracted metadata
    pub metadata: RTSMetadata,
    /// Raw PNG data (for later decoding)
    pub png_data: Vec<u8>,
    /// Whether the particle is currently selected
    pub selected: bool,
    /// Whether the particle is currently running/executing
    pub running: bool,
    /// Console output buffer (for execution results)
    pub console_output: String,
}

impl RTSParticle {
    /// Create an RTSParticle from PNG data
    ///
    /// This method validates the PNG, extracts metadata from tEXt chunks,
    /// and creates a particle that can be placed on the map.
    ///
    /// # Arguments
    ///
    /// * `position` - Position on the infinite map
    /// * `file_name` - Original file name
    /// * `png_data` - Raw PNG file data
    ///
    /// # Returns
    ///
    /// * `Ok(RTSParticle)` if the file is a valid PixelRTS v2 file
    /// * `Err(String)` if validation or extraction fails
    ///
    /// # Example
    ///
    /// ```rust
    /// use infinite_map_rs::entities::RTSParticle;
    /// use glam::Vec2;
    ///
    /// let data = std::fs::read("kernel.rts.png")?;
    /// let particle = RTSParticle::from_png(
    ///     Vec2::new(100.0, 200.0),
    ///     "kernel.rts.png",
    ///     &data
    /// )?;
    /// ```
    pub fn from_png(position: Vec2, file_name: String, png_data: &[u8]) -> Result<Self> {
        // Load the PNG image
        let img =
            image::load_from_memory(png_data).map_err(|e| anyhow!("Failed to load PNG: {}", e))?;

        // Extract metadata from PNG tEXt chunks
        let metadata = Self::extract_metadata(png_data)?;

        // Validate grid size is power of 2
        if !metadata.grid_size.is_power_of_two() {
            return Err(anyhow!(
                "Invalid grid size: {} (must be power of 2)",
                metadata.grid_size
            ));
        }

        // Validate image dimensions match grid size
        if img.width() != metadata.grid_size || img.height() != metadata.grid_size {
            log::warn!(
                "Image dimensions {}x{} don't match grid size {}x{}",
                img.width(),
                img.height(),
                metadata.grid_size,
                metadata.grid_size
            );
        }

        log::info!(
            "Created RTSParticle '{}' (type: {:?}, mode: {:?}, size: {}x{})",
            file_name,
            metadata.rts_type.as_deref().unwrap_or("unknown"),
            metadata.encoding_mode,
            img.width(),
            img.height()
        );

        Ok(Self {
            position,
            file_name,
            image: img,
            metadata,
            png_data: png_data.to_vec(),
            selected: false,
            running: false,
            console_output: String::new(),
        })
    }

    /// Extract metadata from PNG tEXt chunks
    ///
    /// Looks for PixelRTS magic in tEXt chunks and parses the JSON metadata.
    /// If no tEXt chunk is found, attempts to load from sidecar .meta.json file.
    fn extract_metadata(png_data: &[u8]) -> Result<RTSMetadata> {
        // Try to extract from PNG tEXt chunks first
        if let Ok(metadata) = Self::extract_png_text_metadata(png_data) {
            return Ok(metadata);
        }

        // No metadata found in PNG, return default
        log::warn!("No PixelRTS metadata found in PNG tEXt chunks, using defaults");
        Ok(RTSMetadata::default())
    }

    /// Extract metadata from PNG tEXt chunks
    ///
    /// Parses the PNG chunk structure looking for tEXt chunks with PixelRTS magic.
    fn extract_png_text_metadata(png_data: &[u8]) -> Result<RTSMetadata> {
        // PNG signature: 137 80 78 71 13 10 26 10
        const PNG_SIGNATURE: &[u8] = &[0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];

        if !png_data.starts_with(PNG_SIGNATURE) {
            return Err(anyhow!("Not a valid PNG file"));
        }

        // Skip PNG signature (8 bytes)
        let mut pos = 8;

        while pos + 8 <= png_data.len() {
            // Chunk length (4 bytes)
            let chunk_length = u32::from_be_bytes([
                png_data[pos],
                png_data[pos + 1],
                png_data[pos + 2],
                png_data[pos + 3],
            ]) as usize;

            // Chunk type (4 bytes)
            let chunk_type = &png_data[pos + 4..pos + 8];
            let chunk_type_str =
                std::str::from_utf8(chunk_type).map_err(|_| anyhow!("Invalid chunk type"))?;

            // Chunk data starts at pos + 8
            let chunk_data_start = pos + 8;
            let chunk_data_end = chunk_data_start + chunk_length;

            // Check if this is a tEXt chunk
            if chunk_type_str == "tEXt" {
                if let Some(metadata) =
                    Self::parse_text_chunk(&png_data[chunk_data_start..chunk_data_end])?
                {
                    return Ok(metadata);
                }
            }

            // Move to next chunk (data + length + 4 bytes type + 4 bytes CRC)
            pos = chunk_data_end + 4;
        }

        Err(anyhow!("No PixelRTS tEXt chunk found"))
    }

    /// Parse a tEXt chunk for PixelRTS metadata
    ///
    /// tEXt chunk format: keyword + null + text
    /// We look for PixelRTS magic at the start of the text.
    fn parse_text_chunk(chunk_data: &[u8]) -> Result<Option<RTSMetadata>> {
        // Find null separator
        let null_pos = chunk_data
            .iter()
            .position(|&b| b == 0)
            .ok_or_else(|| anyhow!("Invalid tEXt chunk: no null separator"))?;

        // Extract text after null separator
        let text_data = &chunk_data[null_pos + 1..];

        // Check for PixelRTS magic
        if !text_data.starts_with(PIXELRTS_MAGIC) {
            return Ok(None);
        }

        // Parse JSON after magic
        let json_str = std::str::from_utf8(&text_data[PIXELRTS_MAGIC.len()..])
            .map_err(|e| anyhow!("Failed to parse metadata as UTF-8: {}", e))?;

        let metadata_value: serde_json::Value = serde_json::from_str(json_str)
            .map_err(|e| anyhow!("Failed to parse metadata JSON: {}", e))?;

        Ok(Some(Self::parse_metadata_json(metadata_value)?))
    }

    /// Parse metadata from JSON value
    fn parse_metadata_json(value: serde_json::Value) -> Result<RTSMetadata> {
        let obj = value
            .as_object()
            .ok_or_else(|| anyhow!("Metadata must be an object"))?;

        let format_version = obj
            .get("format_version")
            .and_then(|v| v.as_u64())
            .unwrap_or(2) as u32;

        let grid_size = obj
            .get("grid_size")
            .and_then(|v| v.as_u64())
            .ok_or_else(|| anyhow!("Missing grid_size"))? as u32;

        let encoding = obj.get("encoding").and_then(|v| v.as_object());

        let encoding_mode_str = encoding
            .and_then(|e| e.get("type"))
            .and_then(|t| t.as_str())
            .unwrap_or("RGBA-dense");

        let encoding_mode =
            EncodingMode::from_str(encoding_mode_str).unwrap_or(EncodingMode::Standard);

        let bytes_per_pixel = encoding
            .and_then(|e| e.get("bytes_per_pixel"))
            .and_then(|v| v.as_u64())
            .unwrap_or(4) as u32;

        let rts_type = obj
            .get("type")
            .and_then(|v| v.as_str())
            .map(|s| s.to_string());

        let name = obj
            .get("name")
            .and_then(|v| v.as_str())
            .map(|s| s.to_string());

        // Parse offsets if present
        let mut offsets = HashMap::new();
        if let Some(offsets_obj) = obj.get("offsets").and_then(|o| o.as_object()) {
            for (key, value) in offsets_obj {
                if let Some(seg_obj) = value.as_object() {
                    let offset = seg_obj.get("offset").and_then(|v| v.as_u64()).unwrap_or(0) as u64;
                    let size = seg_obj.get("size").and_then(|v| v.as_u64()).unwrap_or(0) as u64;
                    let segment_type = seg_obj
                        .get("type")
                        .and_then(|v| v.as_str())
                        .unwrap_or("binary")
                        .to_string();

                    offsets.insert(
                        key.clone(),
                        SegmentInfo {
                            offset,
                            size,
                            segment_type,
                        },
                    );
                }
            }
        }

        // Parse hashes if present
        let mut hashes = HashMap::new();
        if let Some(hashes_obj) = obj.get("hashes").and_then(|h| h.as_object()) {
            for (key, value) in hashes_obj {
                if let Some(hash_str) = value.as_str() {
                    hashes.insert(key.clone(), hash_str.to_string());
                }
            }
        }

        let original_size = obj
            .get("original_size")
            .and_then(|v| v.as_u64())
            .map(|v| v as u64);

        let timestamp = obj.get("timestamp").and_then(|v| v.as_i64());

        Ok(RTSMetadata {
            format_version,
            grid_size,
            encoding_mode,
            bytes_per_pixel,
            rts_type,
            name,
            offsets,
            hashes,
            original_size,
            timestamp,
        })
    }

    /// Decode the particle data from the PNG using Hilbert curve
    ///
    /// This reverses the PixelRTS v2 encoding process, extracting the original
    /// binary data from the PNG image.
    ///
    /// # Returns
    ///
    /// * `Ok(Vec<u8>)` - The decoded binary data
    /// * `Err(String)` - If decoding fails
    pub fn decode(&self) -> Result<Vec<u8>> {
        let rgba_img = self.image.to_rgba8();
        let grid_size = self.metadata.grid_size;

        // Generate Hilbert curve LUT using the HilbertCurve struct
        let curve = hilbert::HilbertCurve::new(grid_size);
        let lut = curve.generate_lut();

        // Extract bytes along Hilbert curve
        let mut binary_data = Vec::with_capacity((grid_size * grid_size * 4) as usize);

        for pixel_idx in 0..(grid_size * grid_size) {
            let (x, y) = lut[pixel_idx as usize];

            if x >= rgba_img.width() || y >= rgba_img.height() {
                break;
            }

            let pixel = rgba_img.get_pixel(x, y);
            binary_data.push(pixel[0]); // R
            binary_data.push(pixel[1]); // G
            binary_data.push(pixel[2]); // B
            binary_data.push(pixel[3]); // A
        }

        // Trim trailing zeros (padding)
        let trimmed_data = Self::trim_padding(&binary_data);

        log::info!(
            "Decoded {} bytes from RTSParticle '{}'",
            trimmed_data.len(),
            self.file_name
        );

        Ok(trimmed_data)
    }

    /// Generate a thumbnail for the particle
    ///
    /// Creates a smaller version of the PNG for preview rendering.
    ///
    /// # Arguments
    ///
    /// * `max_size` - Maximum width/height of the thumbnail
    ///
    /// # Returns
    ///
    /// A DynamicImage containing the thumbnail
    pub fn generate_thumbnail(&self, max_size: u32) -> DynamicImage {
        let img = &self.image;
        let (width, height) = (img.width(), img.height());

        if width <= max_size && height <= max_size {
            return img.clone();
        }

        // Calculate scaling factor
        let scale = if width > height {
            max_size as f32 / width as f32
        } else {
            max_size as f32 / height as f32
        };

        let new_width = (width as f32 * scale) as u32;
        let new_height = (height as f32 * scale) as u32;

        img.resize(new_width, new_height, image::imageops::FilterType::Lanczos3)
    }

    /// Get a description of the particle for UI display
    pub fn get_description(&self) -> String {
        let type_str = self.metadata.rts_type.as_deref().unwrap_or("unknown");

        let size_mb = self.png_data.len() as f64 / (1024.0 * 1024.0);

        format!(
            "{} ({:.2} MB, {}x{}, {} mode)",
            self.file_name,
            size_mb,
            self.image.width(),
            self.image.height(),
            self.metadata.encoding_mode.as_str()
        )
    }

    /// Trim trailing zeros (padding) from binary data
    fn trim_padding(data: &[u8]) -> Vec<u8> {
        let last_non_zero = data.iter().rposition(|&b| b != 0);
        match last_non_zero {
            Some(pos) => data[..=pos].to_vec(),
            None => Vec::new(),
        }
    }

    /// Check if this particle contains a kernel image
    pub fn is_kernel(&self) -> bool {
        self.metadata.rts_type.as_deref() == Some("kernel")
    }

    /// Check if this particle contains an initrd
    pub fn is_initrd(&self) -> bool {
        self.metadata.rts_type.as_deref() == Some("initrd")
    }

    /// Check if this particle contains WASM bytecode
    pub fn is_wasm(&self) -> bool {
        self.metadata.rts_type.as_deref() == Some("wasm")
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_encoding_mode_from_str() {
        assert_eq!(
            EncodingMode::from_str("standard").unwrap(),
            EncodingMode::Standard
        );
        assert_eq!(
            EncodingMode::from_str("RGBA-dense").unwrap(),
            EncodingMode::Standard
        );
        assert_eq!(EncodingMode::from_str("code").unwrap(), EncodingMode::Code);
        assert_eq!(
            EncodingMode::from_str("RGBA-code").unwrap(),
            EncodingMode::Code
        );
        assert!(EncodingMode::from_str("invalid").is_err());
    }

    #[test]
    fn test_encoding_mode_as_str() {
        assert_eq!(EncodingMode::Standard.as_str(), "RGBA-dense");
        assert_eq!(EncodingMode::Code.as_str(), "RGBA-code");
    }

    #[test]
    fn test_trim_padding() {
        let data = vec![1, 2, 3, 0, 0, 0];
        let trimmed = RTSParticle::trim_padding(&data);
        assert_eq!(trimmed, vec![1, 2, 3]);

        let data = vec![0, 0, 0];
        let trimmed = RTSParticle::trim_padding(&data);
        assert_eq!(trimmed, Vec::<u8>::new());

        let data = vec![1, 2, 3];
        let trimmed = RTSParticle::trim_padding(&data);
        assert_eq!(trimmed, vec![1, 2, 3]);
    }

    #[test]
    fn test_metadata_default() {
        let metadata = RTSMetadata::default();
        assert_eq!(metadata.format_version, 2);
        assert_eq!(metadata.grid_size, 512);
        assert_eq!(metadata.encoding_mode, EncodingMode::Standard);
        assert_eq!(metadata.bytes_per_pixel, 4);
    }

    #[test]
    fn test_extract_png_text_metadata_invalid_png() {
        let invalid_data = vec![0x00, 0x01, 0x02];
        let result = RTSParticle::extract_png_text_metadata(&invalid_data);
        assert!(result.is_err());
    }

    #[test]
    fn test_parse_text_chunk_no_pixelrts() {
        let chunk_data = b"some_key\0some_value";
        let result = RTSParticle::parse_text_chunk(chunk_data);
        assert!(result.is_ok());
        assert!(result.unwrap().is_none());
    }
}
