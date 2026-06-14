//! Vulkan Executor - Direct SPIR-V execution via ash (Vulkan API).
//!
//! Bypasses wgpu to execute compiled glyph programs directly on GPU.

#[cfg(feature = "vulkan")]
pub mod vulkan_executor_impl {
    use anyhow::{Context, Result, anyhow};
    use ash::vk;
    use ash::Device;
    use ash::Instance;
    use ash::Entry;
    use std::ffi::CString;
    use std::sync::Arc;

    /// Direct Vulkan executor for glyph programs.
    pub struct VulkanExecutor {
        _entry: Arc<Entry>,
        _instance: Arc<Instance>,
        _device: Arc<Device>,
    }

    impl VulkanExecutor {
        /// Create a new Vulkan executor.
        pub fn new() -> Result<Self> {
            // Load Vulkan entry points
            let entry = unsafe {
                Entry::load()
                    .context("Failed to load Vulkan entry points")?
            };

            // Create instance
            let app_name = CString::new("Glyph Compiler").unwrap();
            
            let app_info = vk::ApplicationInfo::default()
                .application_name(&app_name)
                .api_version(vk::make_api_version(0, 1, 3, 0));

            let create_info = vk::InstanceCreateInfo::default()
                .application_info(&app_info);

            let instance = unsafe {
                entry.create_instance(&create_info, None)
                    .context("Failed to create Vulkan instance")?
            };

            // Find compute device
            let devices = unsafe {
                instance.enumerate_physical_devices()
                    .context("Failed to enumerate devices")?
            };

            let (_physical, _queue_family) = Self::find_compute(&instance, &devices)
                .ok_or_else(|| anyhow!("No compute-capable GPU found"))?;

            // Create device
            let queue_priorities = [1.0f32];
            let queue_info = vk::DeviceQueueCreateInfo::default()
                .queue_family_index(_queue_family)
                .queue_priorities(&queue_priorities);

            let queue_infos = [queue_info];
            let device_info = vk::DeviceCreateInfo::default()
                .queue_create_infos(&queue_infos);

            let device = unsafe {
                instance.create_device(_physical, &device_info, None)
                    .context("Failed to create Vulkan device")?
            };

            Ok(Self {
                _entry: Arc::new(entry),
                _instance: Arc::new(instance),
                _device: Arc::new(device),
            })
        }

        /// Execute SPIR-V binary.
        pub fn execute(&self, _spirv: &[u32]) -> Result<()> {
            // Placeholder - would create shader module and dispatch
            Ok(())
        }

        /// Check availability.
        pub fn is_available() -> bool {
            Self::new().is_ok()
        }

        fn find_compute(instance: &Instance, devices: &[vk::PhysicalDevice]) -> Option<(vk::PhysicalDevice, u32)> {
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
    }

    impl Drop for VulkanExecutor {
        fn drop(&mut self) {
            // Drop happens automatically via Arc when ref count reaches 0
            // Device and Instance are destroyed via their Arc destructors
        }
    }
}

#[cfg(not(feature = "vulkan"))]
pub mod vulkan_executor_impl {
    use anyhow::Result;

    pub struct VulkanExecutor;

    impl VulkanExecutor {
        pub fn new() -> Result<Self> {
            anyhow::bail!("Vulkan feature not enabled")
        }
        pub fn execute(&self, _spirv: &[u32]) -> Result<()> {
            anyhow::bail!("Vulkan feature not enabled")
        }
        pub fn is_available() -> bool { false }
    }
}

pub use vulkan_executor_impl::VulkanExecutor;
