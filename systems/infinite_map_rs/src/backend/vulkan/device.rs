// systems/infinite_map_rs/src/backend/vulkan/device.rs
//! Vulkan device initialization for direct GPU access.

use anyhow::{Context, Result, anyhow};
use ash::vk;
use ash::Entry;
use ash::Instance;
use ash::Device;
use std::ffi::CString;

/// Vulkan device wrapper for direct GPU access.
pub struct VulkanDevice {
    pub entry: Entry,
    pub instance: Instance,
    pub physical_device: vk::PhysicalDevice,
    pub device: Device,
    pub queue_family_index: u32,
    pub queue: vk::Queue,
    pub compute_queue_index: u32,
}

impl VulkanDevice {
    /// Create a new Vulkan device.
    pub fn new() -> Result<Self> {
        // Initialize entry points
        let entry = unsafe {
            Entry::load()?
        };

        // Create instance - bind CStrings to avoid lifetime issues
        let app_name = CString::new("Geometry OS").unwrap();
        let engine_name = CString::new("Glyph Engine").unwrap();

        let app_info = vk::ApplicationInfo::default()
            .application_name(&app_name)
            .application_version(vk::make_api_version(0, 1, 0, 0))
            .engine_name(&engine_name)
            .engine_version(vk::make_api_version(0, 1, 0, 0))
            .api_version(vk::make_api_version(0, 1, 3, 0));

        let create_info = vk::InstanceCreateInfo::default()
            .application_info(&app_info);

        let instance = unsafe {
            entry.create_instance(&create_info, None)
                .context("Failed to create Vulkan instance")?
        };

        // Find physical device with compute support
        let physical_devices = unsafe {
            instance.enumerate_physical_devices()
                .context("Failed to enumerate physical devices")?
        };

        let (physical_device, queue_family_index, compute_queue_index) =
            Self::find_compute_device(&instance, &physical_devices)
                .context("No suitable GPU found with compute support")?;

        // Create logical device
        let queue_priorities = [1.0f32];
        let queue_create_infos = [
            vk::DeviceQueueCreateInfo::default()
                .queue_family_index(queue_family_index)
                .queue_priorities(&queue_priorities),
        ];

        let device_features = vk::PhysicalDeviceFeatures::default()
            .shader_storage_image_write_without_format(true);

        let device_create_info = vk::DeviceCreateInfo::default()
            .queue_create_infos(&queue_create_infos)
            .enabled_features(&device_features);

        let device = unsafe {
            instance.create_device(physical_device, &device_create_info, None)
                .context("Failed to create Vulkan device")?
        };

        // Get queue
        let queue = unsafe {
            device.get_device_queue(queue_family_index, 0)
        };

        Ok(Self {
            entry,
            instance,
            physical_device,
            device,
            queue_family_index,
            queue,
            compute_queue_index,
        })
    }

    /// Find a device with compute support.
    fn find_compute_device(
        instance: &Instance,
        physical_devices: &[vk::PhysicalDevice],
    ) -> Option<(vk::PhysicalDevice, u32, u32)> {
        for &device in physical_devices {
            let properties = unsafe { instance.get_physical_device_properties(device) };
            let device_name = unsafe {
                std::ffi::CStr::from_ptr(properties.device_name.as_ptr())
                    .to_string_lossy()
            };

            // Check for compute support
            let queue_families = unsafe {
                instance.get_physical_device_queue_family_properties(device)
            };

            for (index, family) in queue_families.iter().enumerate() {
                if family.queue_flags.contains(vk::QueueFlags::COMPUTE) {
                    log::info!("Found GPU: {} (compute queue: {})", device_name, index);
                    return Some((device, index as u32, index as u32));
                }
            }
        }
        None
    }

    /// Get device memory properties.
    pub fn memory_properties(&self) -> vk::PhysicalDeviceMemoryProperties {
        unsafe {
            self.instance.get_physical_device_memory_properties(self.physical_device)
        }
    }

    /// Find memory type index.
    pub fn find_memory_type(
        &self,
        type_filter: u32,
        properties: vk::MemoryPropertyFlags,
    ) -> Result<u32> {
        let mem_props = self.memory_properties();

        for (i, mem_type) in mem_props.memory_types.iter().enumerate() {
            if (type_filter & (1 << i)) != 0
                && mem_type.property_flags.contains(properties)
            {
                return Ok(i as u32);
            }
        }

        Err(anyhow!("Failed to find suitable memory type"))
    }
}

impl Drop for VulkanDevice {
    fn drop(&mut self) {
        unsafe {
            self.device.destroy_device(None);
            self.instance.destroy_instance(None);
        }
    }
}
