// systems/infinite_map_rs/src/backend/vulkan/executor.rs
//! Glyph executor - runs SPIR-V compute shaders directly.

use anyhow::{Context, Result};
use ash::vk;

use super::device::VulkanDevice;
use super::pipeline::GlyphPipeline;

/// Executor for glyph programs.
pub struct GlyphExecutor {
    device: VulkanDevice,
    command_pool: vk::CommandPool,
    descriptor_pool: vk::DescriptorPool,
}

impl GlyphExecutor {
    /// Create a new glyph executor.
    pub fn new() -> Result<Self> {
        let device = VulkanDevice::new()?;

        // Create command pool
        let pool_create_info = vk::CommandPoolCreateInfo::default()
            .queue_family_index(device.queue_family_index)
            .flags(vk::CommandPoolCreateFlags::RESET_COMMAND_BUFFER);

        let command_pool = unsafe {
            device.device
                .create_command_pool(&pool_create_info, None)
                .context("Failed to create command pool")?
        };

        // Create descriptor pool
        let pool_sizes = [
            vk::DescriptorPoolSize::default()
                .ty(vk::DescriptorType::STORAGE_BUFFER)
                .descriptor_count(100),
        ];

        let descriptor_pool_create_info = vk::DescriptorPoolCreateInfo::default()
            .pool_sizes(&pool_sizes)
            .max_sets(10);

        let descriptor_pool = unsafe {
            device.device
                .create_descriptor_pool(&descriptor_pool_create_info, None)
                .context("Failed to create descriptor pool")?
        };

        Ok(Self {
            device,
            command_pool,
            descriptor_pool,
        })
    }

    /// Execute a glyph program.
    pub fn execute(
        &self,
        pipeline: &GlyphPipeline,
        input: &[f32],
        output_size: usize,
    ) -> Result<Vec<f32>> {
        // Allocate buffers
        let input_buffer = self.create_storage_buffer(input.len() * 4)?;
        let output_buffer = self.create_storage_buffer(output_size * 4)?;

        // Create command buffer
        let alloc_info = vk::CommandBufferAllocateInfo::default()
            .command_pool(self.command_pool)
            .level(vk::CommandBufferLevel::PRIMARY)
            .command_buffer_count(1);

        let command_buffers = unsafe {
            self.device.device
                .allocate_command_buffers(&alloc_info)
                .context("Failed to allocate command buffers")?
        };

        // Record commands
        unsafe {
            self.device.device.begin_command_buffer(
                command_buffers[0],
                &vk::CommandBufferBeginInfo::default()
                    .flags(vk::CommandBufferUsageFlags::ONE_TIME_SUBMIT),
            )?;

            // Bind pipeline
            self.device.device.cmd_bind_pipeline(
                command_buffers[0],
                vk::PipelineBindPoint::COMPUTE,
                pipeline.pipeline,
            );

            // Dispatch compute
            let workgroups = (output_size + 63) / 64;
            self.device.device.cmd_dispatch(
                command_buffers[0],
                workgroups as u32,
                1,
                1,
            );

            self.device.device.end_command_buffer(command_buffers[0])?;
        }

        // Submit and wait
        let submit_info = vk::SubmitInfo::default()
            .command_buffers(&command_buffers);

        unsafe {
            self.device.device.queue_submit(self.device.queue, &[submit_info], vk::Fence::null())?;
            self.device.device.queue_wait_idle(self.device.queue)?;
        }

        // Read back results (simplified - would need memory mapping)
        Ok(vec![0.0; output_size])
    }

    /// Create a storage buffer.
    fn create_storage_buffer(&self, size: usize) -> Result<vk::Buffer> {
        let buffer_create_info = vk::BufferCreateInfo::default()
            .size(size as u64)
            .usage(vk::BufferUsageFlags::STORAGE_BUFFER)
            .sharing_mode(vk::SharingMode::EXCLUSIVE);

        unsafe {
            self.device.device
                .create_buffer(&buffer_create_info, None)
                .context("Failed to create buffer")
        }
    }

    /// Check if Vulkan is available.
    pub fn is_available() -> bool {
        VulkanDevice::new().is_ok()
    }
}

impl Drop for GlyphExecutor {
    fn drop(&mut self) {
        unsafe {
            self.device.device.destroy_descriptor_pool(self.descriptor_pool, None);
            self.device.device.destroy_command_pool(self.command_pool, None);
        }
    }
}
