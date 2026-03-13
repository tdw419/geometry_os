//! DRM/KMS Backend - Direct GPU execution via Linux DRM subsystem.
//!
//! This module provides direct GPU access via DRM/KMS for Phase 2
//! of the Glyph-to-Metal pipeline.

pub mod device;
pub mod scanout;
pub mod compute;
pub mod dmabuf;
pub mod amdgpu;
pub mod intel;
pub mod vcc_compute;

pub use device::DrmDevice;
pub use scanout::KmsScanout;
pub use compute::GlyphCompute;
pub use dmabuf::{DmaBuf, ZeroCopyPipeline};
pub use amdgpu::command_buffer::AmdgpuCommandBuffer;
pub use intel::IntelCommandBuffer;
pub use vcc_compute::VccCompute;
