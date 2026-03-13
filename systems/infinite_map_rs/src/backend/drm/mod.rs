//! DRM/KMS Backend - Direct GPU execution via Linux DRM subsystem.
//!
//! This module provides direct GPU access via DRM/KMS for Phase 2
//! of the Glyph-to-Metal pipeline.

pub mod device;
pub mod scanout;
pub mod compute;

pub use device::DrmDevice;
pub use scanout::KmsScanout;
pub use compute::GlyphCompute;
