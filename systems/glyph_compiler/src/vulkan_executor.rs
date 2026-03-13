//! Vulkan Executor - Direct SPIR-V execution via ash.
//!
//! Bypasses wgpu to execute compiled glyph programs directly.

use anyhow::{Context, Result, anyhow};
use ash::vk;
use ash::Device;
use ash::Instance;
use ash::Entry;
use std::ffi::CString;

/// Direct Vulkan executor for glyph programs.
pub struct VulkanExecutor {
    entry: Entry,
    instance: Instance,
    physical_device: vk::PhysicalDevice,
    device: Device,
    compute_queue: vk::Queue,
    compute_queue_family: u32,
    command_pool: vk::CommandPool,
}

impl VulkanExecutor {
    /// Create a new Vulkan executor.
    pub fn new() -> Result<Self> {
        // Load Vulkan entry points
        let entry = unsafe { Entry::load()? };

        // Create instance
        let app_info = vk::ApplicationInfo::default()
            .application_name(&CString::new("Glyph Compiler").unwrap())
            .api_version(vk::make_api_version(1, 3, 0));

        let create_info = vk::InstanceCreateInfo::default()
            .application_info(&app_info);

        let instance = unsafe {
            entry.create_instance(&create_info, None)
                .context("Failed to create Vulkan instance")?
        };

        // Find compute-capable device
        let physical_devices = unsafe {
            instance.enumerate_physical_devices()
                .context("Failed to enumerate physical devices")?
        };

        let (physical_device, queue_family) = Self::find_compute_device(&instance, &physical_devices)
            .ok_or_else(|| anyhow!("No GPU with compute support found"))?;

        // Create device
        let queue_priorities = [1.0f32];
        let queue_create_info = vk::DeviceQueueCreateInfo::default()
            .queue_family_index(queue_family)
            .queue_priorities(&queue_priorities);

        let device_create_info = vk::DeviceCreateInfo::default()
            .queue_create_infos(&[queue_create_info]);

        let device = unsafe {
            instance.create_device(physical_device, &device_create_info, None)
                .context("Failed to create Vulkan device")?
        };

        // Get queue
        let compute_queue = unsafe {
            device.get_device_queue(queue_family, 0)
        };

        // Create command pool
        let pool_info = vk::CommandPoolCreateInfo::default()
            .queue_family_index(queue_family);

        let command_pool = unsafe {
            device.create_command_pool(&pool_info, None)
                .context("Failed to create command pool")?
        };

        Ok(Self {
            entry,
            instance,
            physical_device,
            device,
            compute_queue,
            compute_queue_family: queue_family,
            command_pool,
        })
    }

    /// Execute SPIR-V compute shader.
    pub fn execute_spirv(&self, spirv_words: &[u32]) -> Result<Vec<f32>> {
        // Create shader module
        let shader_info = vk::ShaderModuleCreateInfo::default()
            .code(spirv_words);

        let shader_module = unsafe {
            self.device.create_shader_module(&shader_info, None)?
        };

        // Create pipeline (simplified)
        let stage_info = vk::PipelineShaderStageCreateInfo::default()
            .stage(vk::ShaderStageFlags::COMPUTE)
            .module(shader_module)
            .name(&CString::new("main").unwrap());

        let pipeline_layout_info = vk::PipelineLayoutCreateInfo::default();
        let pipeline_layout = unsafe {
            self.device.create_pipeline_layout(&pipeline_layout_info, None)?
        };

        let pipeline_info = vk::ComputePipelineCreateInfo::default()
            .stage(stage_info)
            .layout(pipeline_layout);

        let pipeline = unsafe {
            self.device.create_compute_pipelines(vk::PipelineCache::null(), &[pipeline_info], None)
                .context("Failed to create compute pipeline")?[0]
        };

        // Cleanup (placeholder - full implementation would execute)
        unsafe {
            self.device.destroy_pipeline(pipeline, None);
            self.device.destroy_pipeline_layout(pipeline_layout, None);
            self.device.destroy_shader_module(shader_module, None);
        }

        Ok(vec![0.0; 16])
    }

    fn find_compute_device(
        instance: &Instance,
        devices: &[vk::PhysicalDevice],
    ) -> Option<(vk::PhysicalDevice, u32)> {
        for &device in devices {
            let families = unsafe { instance.get_physical_device_queue_family_properties(device) };
            for (i, family) in families.iter().enumerate() {
                if family.queue_flags.contains(vk::QueueFlags::COMPUTE) {
                    return Some((device, i as u32));
                }
            }
        }
        None
    }

    /// Check if Vulkan is available.
    pub fn is_available() -> bool {
        Self::new().is_ok()
    }
}

impl Drop for VulkanExecutor {
    fn drop(&mut self) {
        unsafe {
            self.device.destroy_command_pool(self.command_pool, None);
            self.device.destroy_device(None);
            self.instance.destroy_instance(None);
        }
    }
}
