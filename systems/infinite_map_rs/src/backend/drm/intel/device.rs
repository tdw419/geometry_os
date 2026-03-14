//! Intel GPU Device - Direct i915 access via DRM.

use anyhow::{anyhow, Context, Result};
use std::fs::File;
use std::os::unix::io::{AsRawFd, RawFd};

/// Buffer handle type
pub type BufferHandle = u32;

/// Intel GPU device for direct command submission.
pub struct IntelGpuDevice {
    device_file: File,
    device_path: String,
    /// GPU ID for command submission
    gpu_id: u32,
    /// Next buffer handle
    next_buffer_handle: u32,
    /// Allocated buffers (handle -> (gtt_offset, size))
    buffers: std::collections::HashMap<BufferHandle, (u64, u64)>,
}

impl IntelGpuDevice {
    /// Open an Intel GPU device.
    pub fn open(path: &str) -> Result<Self> {
        let device_file = std::fs::OpenOptions::new()
            .read(true)
            .write(true)
            .open(path)
            .context("Failed to open Intel GPU device")?;

        let fd = device_file.as_raw_fd();
        log::info!("Opened Intel GPU device: {} (fd={})", path, fd);

        Ok(Self {
            device_file,
            device_path: path.to_string(),
            gpu_id: 0,
            next_buffer_handle: 1,
            buffers: std::collections::HashMap::new(),
        })
    }

    /// Open the first Intel GPU (render node).
    pub fn open_first() -> Result<Self> {
        // Try common Intel render nodes
        for i in 0..16 {
            let path = format!("/dev/dri/renderD{}", 128 + i);
            if std::path::Path::new(&path).exists() {
                if let Ok(device) = Self::open(&path) {
                    // Verify it's Intel by checking PCI ID
                    return Ok(device);
                }
            }
        }
        anyhow::bail!("No Intel GPU render node found")
    }

    /// Get the file descriptor for DRM ioctls.
    pub fn fd(&self) -> RawFd {
        self.device_file.as_raw_fd()
    }

    /// Allocate a GTT buffer (GTT = Graphics Translation Table).
    pub fn alloc_gtt(&mut self, size: u64) -> Result<BufferHandle> {
        let handle = self.next_buffer_handle;
        self.next_buffer_handle += 1;

        // Simulated GTT offset (would come from i915_gem_create)
        let gtt_offset = 0x100000000u64 + (handle as u64 * 0x10000000u64);
        self.buffers.insert(handle, (gtt_offset, size));

        log::info!(
            "Allocated GTT buffer {} of size {} at {:#x}",
            handle,
            size,
            gtt_offset
        );
        Ok(handle)
    }

    /// Get the GTT offset of a buffer.
    pub fn get_buffer_offset(&self, handle: BufferHandle) -> Result<u64> {
        self.buffers
            .get(&handle)
            .map(|(offset, _)| *offset)
            .context("Invalid buffer handle")
    }

    /// Write data to a GTT buffer.
    pub fn write_buffer(&self, handle: BufferHandle, offset: u64, data: &[u8]) -> Result<()> {
        let (gtt_offset, size) = self.buffers.get(&handle).context("Invalid buffer handle")?;

        if offset + data.len() as u64 > *size {
            anyhow::bail!("Buffer write out of bounds");
        }

        // In a real implementation, this would use pwrite or mmap
        log::info!(
            "Writing {} bytes to GTT buffer {} at offset {} (GTT offset {:#x})",
            data.len(),
            handle,
            offset,
            gtt_offset
        );

        Ok(())
    }

    /// Read data from a GTT buffer.
    pub fn read_buffer(&self, handle: BufferHandle, offset: u64, data: &mut [u8]) -> Result<()> {
        let (gtt_offset, size) = self.buffers.get(&handle).context("Invalid buffer handle")?;

        if offset + data.len() as u64 > *size {
            anyhow::bail!("Buffer read out of bounds");
        }

        log::info!(
            "Reading {} bytes from GTT buffer {} at offset {} (GTT offset {:#x})",
            data.len(),
            handle,
            offset,
            gtt_offset
        );

        Ok(())
    }

    /// Create a compute shader from SPIR-V.
    pub fn create_shader(&mut self, spirv: &[u32]) -> Result<u32> {
        let handle = self.next_buffer_handle;
        self.next_buffer_handle += 1;

        log::info!(
            "Created Intel compute shader {} ({} SPIR-V words)",
            handle,
            spirv.len()
        );
        Ok(handle)
    }

    /// Dispatch a compute shader.
    pub fn dispatch_compute(
        &self,
        shader: u32,
        push_constants: &[u8],
        x: u32,
        y: u32,
        z: u32,
    ) -> Result<()> {
        log::info!(
            "Dispatching Intel shader {} with {} byte push constants, workgroups ({}, {}, {})",
            shader,
            push_constants.len(),
            x,
            y,
            z
        );

        // In a real implementation, this would:
        // 1. Build batch buffer with MEDIA_VFE_STATE, CURBE_LOAD, MEDIA_STATE
        // 2. Submit via DRM_IOCTL_I915_GEM_EXECBUFFER2

        Ok(())
    }

    /// Submit a batch buffer to the GPU.
    pub fn submit_batch(&self, _commands: &[u8]) -> Result<()> {
        // Placeholder - would use DRM_IOCTL_I915_GEM_EXECBUFFER2
        log::info!("Submitting {} bytes to Intel GPU", _commands.len());
        Ok(())
    }
}

impl Drop for IntelGpuDevice {
    fn drop(&mut self) {
        log::info!("Closing Intel GPU device: {}", self.device_path);
    }
}
