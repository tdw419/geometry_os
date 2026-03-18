//! GPU Module
//!
//! Provides GPU-related functionality for the infinite map system,
//! including WGSL shader compilation and WebGPU operations.

pub mod geometric_vm;
pub mod glyph_vm;
pub mod hebbian_processor;
pub mod wgsl_compiler;

pub use geometric_vm::{GeometricState, GeometricVM};
pub use hebbian_processor::{GPUHebbianProcessor, HebbianUniforms, HebbianUpdate};
pub use wgsl_compiler::WGSLCompiler;
