//! Vulkan Backend - Direct GPU execution via ash (Vulkan API).
//!
//! This module provides direct GPU access bypassing wgpu for Phase 2
//! of the Glyph-to-Metal pipeline.

mod device;
mod pipeline;
mod executor;

pub use device::VulkanDevice;
pub use pipeline::GlyphPipeline;
pub use executor::GlyphExecutor;
