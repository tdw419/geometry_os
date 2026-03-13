//! Intel GPU Backend - Direct i915 command submission via DRM.
//!
//! This module implements direct command buffer submission to Intel GPUs
//! via the i915 DRM driver, bypassing Vulkan for Phase 2.

pub mod device;
pub mod command_buffer;
pub mod shader;

pub use device::IntelGpuDevice;
pub use command_buffer::IntelCommandBuffer;
pub use shader::ComputeShader;
