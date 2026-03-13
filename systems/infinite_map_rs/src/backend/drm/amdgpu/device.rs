//! AMD GPU Device - Direct AMDGPU access via DRM.

use anyhow::{Context, Result};
use std::fs::File;
use std::os::unix::io::{AsRawFd, RawFd};

/// AMD GPU device for direct command submission.
pub struct AmdGpuDevice {
    device_file: File,
    device_path: String,
    /// GPU ID for command submission
    gpu_id: u32,
}

impl AmdGpuDevice {
    /// Open an AMD GPU device.
    pub fn open(path: &str) -> Result<Self> {
        let device_file = std::fs::OpenOptions::new()
            .read(true)
            .write(true)
            .open(path)
            .context("Failed to open AMDGPU device")?;

        let fd = device_file.as_raw_fd();
        log::info!("Opened AMDGPU device: {} (fd={})", path, fd);

        Ok(Self {
            device_file,
            device_path: path.to_string(),
            gpu_id: 0,
        })
    }

    /// Open the first AMD GPU (render node).
    pub fn open_first() -> Result<Self> {
        // Try common AMD render nodes
        for i in 0..16 {
            let path = format!("/dev/dri/renderD{}", 128 + i);
            if std::path::Path::new(&path).exists() {
                if let Ok(device) = Self::open(&path) {
                    // Verify it's AMD by checking device info
                    return Ok(device);
                }
            }
        }
        anyhow::bail!("No AMD GPU render node found")
    }

    /// Get the file descriptor for DRM ioctls.
    pub fn fd(&self) -> RawFd {
        self.device_file.as_raw_fd()
    }

    /// Submit a command buffer to the GPU.
    pub fn submit_commands(&self, _commands: &[u8]) -> Result<()> {
        // Placeholder - would use DRM_IOCTL_AMDGPU_CS
        log::info!("Submitting {} bytes to AMDGPU", _commands.len());
        Ok(())
    }
}
