//! Vulkan Backend - Direct GPU execution via ash (Vulkan API).
//!
//! This module provides direct GPU access bypassing wgpu for Phase 2
//! of the Glyph-to-Metal pipeline.

mod device;
mod executor;
mod pipeline;

pub use device::VulkanDevice;
pub use executor::GlyphExecutor;
pub use pipeline::GlyphPipeline;
