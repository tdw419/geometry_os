//! Bare Metal Module
//!
//! Phase 4: Direct GPU framebuffer rendering without OS compositor
//!
//! This module provides components for bare metal rendering:
//! - Screen dimension configuration
//! - GPU framebuffer access
//! - KMS/DRM scanout pipeline
//! - SPIR-V shader compilation

pub mod framebuffer;
pub mod screen;
pub mod spirv_compiler;

pub use framebuffer::{FramebufferFormat, GpuFramebuffer};
pub use screen::ScreenDimensionsConfig;
pub use spirv_compiler::SpirvCompiler;
