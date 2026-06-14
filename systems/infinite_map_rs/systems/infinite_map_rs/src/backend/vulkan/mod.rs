//! Vulkan Backend - Direct SPIR-V Execution
//!
//! Bypasses WebGPU to execute glyph-compiled SPIR-V directly.

mod device;
mod pipeline;
mod executor;

pub use device::VulkanDevice;
pub use pipeline::GlyphPipeline;
pub use executor::GlyphExecutor;

use anyhow::Result;

/// Initialize the Vulkan backend
pub fn init() -> Result<VulkanDevice> {
    VulkanDevice::new()
}
