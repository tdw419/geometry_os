//! PixelBrain: Neural Network Weights as GPU Texture Pixels
//!
//! This module implements the core architecture for storing and manipulating
//! LLM weights as visible pixels in a GPU texture atlas.
//!
//! ## Architecture
//!
//! - **Weight Atlas**: 2048×2048 RGBA texture storing weights as Float16 pixels
//! - **Hilbert Addressing**: Spatial locality preservation via Hilbert curve
//! - **Float16 Encoding**: Weights encoded in R,G channels (B,A for metadata)
//!
//! ## Usage
//!
//! ```rust,ignore
//! use infinite_map_rs::pixel_brain::{WeightAtlas, encode_weight_f16, decode_weight_f16};
//!
//! // Create a 2048×2048 weight atlas
//! let atlas = WeightAtlas::new(2048);
//!
//! // Convert Hilbert distance to texture coordinates
//! let (x, y) = atlas.hilbert_d2xy(0x7FFF);
//!
//! // Encode/decode weights
//! let encoded = encode_weight_f16(0.5);
//! let decoded = decode_weight_f16(encoded);
//! assert!((decoded - 0.5).abs() < 0.001);
//! ```
//!
//! ## Weight Encoding
//!
//! Each pixel encodes one Float16 weight:
//! - **R, G channels**: Float16 bits (R=low byte, G=high byte)
//! - **B channel**: Access frequency (for visual debugging)
//! - **A channel**: Saliency score (for thought pulse visualization)

pub mod atlas;
pub mod infer;
pub mod tokenizer;
pub mod multi_brain;

pub use atlas::*;
pub use infer::*;
pub use tokenizer::*;
