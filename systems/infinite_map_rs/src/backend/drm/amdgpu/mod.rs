//! AMDGPU Backend - Direct AMD GPU command submission via DRM.
//!
//! This module implements direct command buffer submission to AMD GPUs
//! via the amdgpu DRM driver, bypassing Vulkan for Phase 2.

pub mod command_buffer;
pub mod device;
pub mod mmio;
pub mod shader;

pub use command_buffer::AmdgpuCommandBuffer;
pub use device::AmdGpuDevice;
pub use mmio::AmdGpuDevice as AmdGpuMmioDevice;
pub use shader::ComputeShader;
