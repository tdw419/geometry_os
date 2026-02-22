//! RTS (.rts.png) Format Module
//!
//! This module handles extraction and parsing of various data types from
//! .rts.png (Real-Time Shader) files, which can contain:
//! - WGSL shaders (blue-purple color scheme)
//! - Binary executables (red-orange color scheme)
//! - PixelCPU bytecode (green-yellow color scheme)
//! - Other embedded data
//!
//! # File Format
//!
//! .rts.png files use multiple encoding strategies:
//! 1. **PNG tEXt chunks**: Metadata chunk with "type:wgsl-shader" identifier
//! 2. **Alpha channel encoding**: Blue-purple colors (low R, high B) indicate WGSL
//! 3. **Hilbert curve encoding**: Data distributed spatially along Hilbert curve
//!
//! # Example
//!
//! ```rust
//! use infinite_map_rs::rts::extractor::extract_wgsl_from_rts;
//!
//! let rts_data = std::fs::read("shader.rts.png")?;
//! let wgsl_bytes = extract_wgsl_from_rts(&rts_data)?;
//! let wgsl_string = String::from_utf8(wgsl_bytes)?;
//! ```

pub mod extractor;
pub mod geometric_extractor;

// Re-export main extraction functions for convenience
pub use extractor::{extract_wgsl_from_rts, is_wgsl_color, is_wgsl_metadata, WgslExtractor};
pub use geometric_extractor::extract_geometric_from_rts;

#[cfg(test)]
mod extractor_tests;
