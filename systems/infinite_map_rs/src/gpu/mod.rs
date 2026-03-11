//! GPU Module
//!
//! Provides GPU-related functionality for the infinite map system,
//! including WGSL shader compilation and WebGPU operations.

pub mod wgsl_compiler;
pub mod geometric_vm;

pub use wgsl_compiler::WGSLCompiler;
pub use geometric_vm::{GeometricVM, GeometricState};
