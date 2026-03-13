//! DRM Device - Direct GPU device access via Linux DRM.

use anyhow::{Context, Result};
use std::fs::File;
use std::os::unix::io::AsRawFd;

/// DRM device for direct GPU access.
pub struct DrmDevice {
    device_file: File,
}

impl DrmDevice {
    /// Open a DRM device (typically /dev/dri/card0).
    pub fn open(path: &str) -> Result<Self> {
        let device_file = std::fs::OpenOptions::new()
            .read(true)
            .write(true)
            .open(path)
            .context("Failed to open DRM device")?;

        let fd = device_file.as_raw_fd();
        log::info!("Opened DRM device: {} (fd={})", path, fd);

        Ok(Self { device_file })
    }

    /// Open the default DRM device (/dev/dri/card0).
    pub fn open_default() -> Result<Self> {
        Self::open("/dev/dri/card0")
    }

    /// Get the file descriptor.
    pub fn fd(&self) -> i32 {
        self.device_file.as_raw_fd()
    }

    /// Get reference to the device file.
    pub fn file(&self) -> &File {
        &self.device_file
    }
}
