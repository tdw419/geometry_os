// systems/infinite_map_rs/src/backend/vulkan/pipeline.rs
//! Glyph pipeline - loads SPIR-V and creates compute pipeline.

use anyhow::{Context, Result};
use ash::vk;

use super::device::VulkanDevice;

/// Glyph compute pipeline for SPIR-V execution.
pub struct GlyphPipeline {
    pub pipeline_layout: vk::PipelineLayout,
    pub pipeline: vk::Pipeline,
    pub descriptor_set_layout: vk::DescriptorSetLayout,
}

impl GlyphPipeline {
    /// Create a glyph pipeline from compiled SPIR-V.
    pub fn new(device: &VulkanDevice, spirv_bytes: &[u32]) -> Result<Self> {
        // Create descriptor set layout for storage buffers
        let bindings = [
            // Input/Output buffer
            vk::DescriptorSetLayoutBinding::default()
                .binding(0)
                .descriptor_type(vk::DescriptorType::STORAGE_BUFFER)
                .descriptor_count(1)
                .stage_flags(vk::ShaderStageFlags::COMPUTE),
        ];

        let layout_create_info = vk::DescriptorSetLayoutCreateInfo::default().bindings(&bindings);

        let descriptor_set_layout = unsafe {
            device
                .device
                .create_descriptor_set_layout(&layout_create_info, None)
                .context("Failed to create descriptor set layout")?
        };

        // Create pipeline layout - bind array to avoid lifetime issues
        let set_layouts = [descriptor_set_layout];
        let pipeline_layout_create_info =
            vk::PipelineLayoutCreateInfo::default().set_layouts(&set_layouts);

        let pipeline_layout = unsafe {
            device
                .device
                .create_pipeline_layout(&pipeline_layout_create_info, None)
                .context("Failed to create pipeline layout")?
        };

        // Create shader module from SPIR-V
        let shader_create_info = vk::ShaderModuleCreateInfo::default().code(spirv_bytes);

        let shader_module = unsafe {
            device
                .device
                .create_shader_module(&shader_create_info, None)
                .context("Failed to create shader module")?
        };

        // Create compute pipeline
        let shader_stage = vk::PipelineShaderStageCreateInfo::default()
            .stage(vk::ShaderStageFlags::COMPUTE)
            .module(shader_module)
            .name(c"main");

        let pipeline_create_info = vk::ComputePipelineCreateInfo::default()
            .stage(shader_stage)
            .layout(pipeline_layout);

        let pipeline_result = unsafe {
            device.device.create_compute_pipelines(
                vk::PipelineCache::null(),
                &[pipeline_create_info],
                None,
            )
        };

        let pipeline = match pipeline_result {
            Ok(pipelines) => pipelines[0],
            Err((_, e)) => {
                anyhow::bail!("Failed to create compute pipeline: {:?}", e);
            },
        };

        // Cleanup shader module (not needed after pipeline creation)
        unsafe {
            device.device.destroy_shader_module(shader_module, None);
        }

        Ok(Self {
            pipeline_layout,
            pipeline,
            descriptor_set_layout,
        })
    }

    /// Create a simple compute pipeline (built-in)
    pub fn create_simple(device: &VulkanDevice) -> Result<Self> {
        // Simple passthrough compute shader in SPIR-V
        // This is a minimal compute shader that does vec4 addition
        let spirv = Self::passthrough_spirv();
        Self::new(device, &spirv)
    }

    /// Minimal SPIR-V passthrough shader (as words)
    fn passthrough_spirv() -> Vec<u32> {
        vec![
            0x07230203, // Magic
            0x00010600, // Version 1.6
            0x00000000, // Generator
            0x00000003, // Bound
            0x00000000, // Schema
                        // Entry point and type info would go here
                        // This is a placeholder - real SPIR-V would be 100+ words
        ]
    }
}

impl Drop for GlyphPipeline {
    fn drop(&mut self) {
        // Cleanup handled by device destruction
    }
}
