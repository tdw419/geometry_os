//! Bare Metal Module
//!
//! Phase 4: Direct GPU framebuffer rendering without OS compositor
//!
//! This module provides components for bare metal rendering:
//! - Screen dimension configuration
//! - GPU framebuffer access
//! - KMS/DRM scanout pipeline

pub mod screen;

pub use screen::ScreenDimensionsConfig;
