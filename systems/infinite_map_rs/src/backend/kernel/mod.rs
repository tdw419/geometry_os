//! Kernel Module Backend - Direct glyph execution via /dev/geometry_os
//!
//! This module provides userspace interface to the Geometry OS kernel module
//! for Phase 3 of the Glyph-to-Metal pipeline.

use anyhow::{anyhow, Context, Result};
use std::fs::{File, OpenOptions};
use std::os::unix::io::{AsRawFd, RawFd};

/// IOCTL magic number
const GEOMETRY_OS_IOC_MAGIC: u8 = b'G';

/// IOCTL commands
const IOC_SUBMIT: u8 = 0x01;
const IOC_EXEC: u8 = 0x02;
const IOC_WAIT: u8 = 0x03;
const IOC_INFO: u8 = 0x04;
const IOC_DMABUF: u8 = 0x05;
const IOC_PIN_BUS: u8 = 0x06;
const IOC_UPDATE_MOUSE: u8 = 0x07;
const IOC_ATTEST: u8 = 0x08;

/// Glyph program submission structure
#[repr(C)]
pub struct GlyphSubmit {
    /// Pointer to SPIR-V binary
    pub spirv_ptr: u64,
    /// Size in bytes
    pub spirv_size: u32,
    /// Dispatch dimensions
    pub workgroup_x: u32,
    pub workgroup_y: u32,
    pub workgroup_z: u32,
    pub reserved: [u32; 5],
}

/// Execution result
#[repr(C)]
pub struct GlyphResult {
    /// GPU cycles executed
    pub cycles: u64,
    /// 0 = success, non-zero = error
    pub status: u32,
    /// Output buffer size
    pub output_size: u32,
    /// Output buffer pointer
    pub output_ptr: u64,
    pub reserved: [u32; 8],
}

/// GPU information
#[repr(C)]
pub struct GpuInfo {
    /// PCI vendor ID
    pub vendor_id: u32,
    /// PCI device ID
    pub device_id: u32,
    /// Number of compute units
    pub compute_units: u32,
    /// VRAM size in MB
    pub vram_size_mb: u32,
    /// GTT size in MB
    pub gtt_size_mb: u32,
    /// Driver version
    pub driver_version: u32,
    pub reserved: [u32; 8],
}

/// DMA-BUF export result
#[repr(C)]
pub struct DmabufExport {
    /// Prime file descriptor
    pub fd: i32,
    /// Buffer size
    pub size: u32,
    pub width: u32,
    pub height: u32,
    pub stride: u32,
    /// FourCC format
    pub format: u32,
    pub reserved: [u32; 4],
}

/// Mouse event for interaction bus
#[repr(C)]
pub struct MouseEvent {
    pub x: i32,
    pub y: i32,
    pub buttons: u32,
    pub dx: i32,
    pub dy: i32,
    pub reserved: [u32; 3],
}

/// Hardware VCC attestation
#[repr(C)]
pub struct VccAttest {
    pub expected_hash: [u32; 8],
    pub status: u32,
    pub reserved: [u32; 7],
}

/// Generate ioctl number: _IOW(type, nr, size)
const fn iow(type_: u8, nr: u8, size: usize) -> u64 {
    (1_u64 << 30) | ((size as u64) << 16) | ((type_ as u64) << 8) | (nr as u64)
}

/// Generate ioctl number: _IOR(type, nr, size)
const fn ior(type_: u8, nr: u8, size: usize) -> u64 {
    (2_u64 << 30) | ((size as u64) << 16) | ((type_ as u64) << 8) | (nr as u64)
}

/// Generate ioctl number: _IO(type, nr)
const fn io(type_: u8, nr: u8) -> u64 {
    ((type_ as u64) << 8) | (nr as u64)
}

/// Generate ioctl number: _IOWR(type, nr, size)
const fn iowr(type_: u8, nr: u8, size: usize) -> u64 {
    (3_u64 << 30) | ((size as u64) << 16) | ((type_ as u64) << 8) | (nr as u64)
}

/// Kernel module interface for direct glyph execution.
pub struct KernelInterface {
    device_file: File,
    /// Device path (scaffolding: future multi-device support)
    #[allow(dead_code)]
    device_path: String,
}

impl KernelInterface {
    /// Open the kernel module device.
    pub fn open() -> Result<Self> {
        Self::open_path("/dev/geometry_os")
    }

    /// Open the kernel module at a specific path.
    pub fn open_path(path: &str) -> Result<Self> {
        let device_file = OpenOptions::new()
            .read(true)
            .write(true)
            .open(path)
            .context("Failed to open geometry_os device. Is the kernel module loaded?")?;

        log::info!("Opened kernel module: {}", path);

        Ok(Self {
            device_file,
            device_path: path.to_string(),
        })
    }

    /// Get the file descriptor.
    pub fn fd(&self) -> RawFd {
        self.device_file.as_raw_fd()
    }

    /// Query GPU information.
    pub fn get_gpu_info(&self) -> Result<GpuInfo> {
        let mut info = GpuInfo {
            vendor_id: 0,
            device_id: 0,
            compute_units: 0,
            vram_size_mb: 0,
            gtt_size_mb: 0,
            driver_version: 0,
            reserved: [0; 8],
        };

        let cmd = ior(
            GEOMETRY_OS_IOC_MAGIC,
            IOC_INFO,
            std::mem::size_of::<GpuInfo>(),
        );

        unsafe {
            let ret = libc::ioctl(self.fd(), cmd as _, &mut info as *mut _);
            if ret < 0 {
                return Err(anyhow!(
                    "ioctl(INFO) failed: {}",
                    std::io::Error::last_os_error()
                ));
            }
        }

        log::info!(
            "GPU Info: vendor={:#06x}, device={:#06x}",
            info.vendor_id,
            info.device_id
        );

        Ok(info)
    }

    /// Submit a SPIR-V program for execution.
    pub fn submit(&self, spirv: &[u32], x: u32, y: u32, z: u32) -> Result<()> {
        let submit = GlyphSubmit {
            spirv_ptr: spirv.as_ptr() as u64,
            spirv_size: (spirv.len() * 4) as u32,
            workgroup_x: x,
            workgroup_y: y,
            workgroup_z: z,
            reserved: [0; 5],
        };

        let cmd = iow(
            GEOMETRY_OS_IOC_MAGIC,
            IOC_SUBMIT,
            std::mem::size_of::<GlyphSubmit>(),
        );

        unsafe {
            let ret = libc::ioctl(self.fd(), cmd as _, &submit as *const _);
            if ret < 0 {
                return Err(anyhow!(
                    "ioctl(SUBMIT) failed: {}",
                    std::io::Error::last_os_error()
                ));
            }
        }

        log::info!(
            "Submitted SPIR-V: {} words, dispatch {}x{}x{}",
            spirv.len(),
            x,
            y,
            z
        );

        Ok(())
    }

    /// Execute the submitted program.
    pub fn exec(&self) -> Result<()> {
        let cmd = io(GEOMETRY_OS_IOC_MAGIC, IOC_EXEC);

        unsafe {
            let ret = libc::ioctl(self.fd(), cmd as _);
            if ret < 0 {
                return Err(anyhow!(
                    "ioctl(EXEC) failed: {}",
                    std::io::Error::last_os_error()
                ));
            }
        }

        log::info!("Execution started");
        Ok(())
    }

    /// Wait for execution to complete.
    pub fn wait(&self) -> Result<GlyphResult> {
        let mut result = GlyphResult {
            cycles: 0,
            status: 0,
            output_size: 0,
            output_ptr: 0,
            reserved: [0; 8],
        };

        let cmd = ior(
            GEOMETRY_OS_IOC_MAGIC,
            IOC_WAIT,
            std::mem::size_of::<GlyphResult>(),
        );

        unsafe {
            let ret = libc::ioctl(self.fd(), cmd as _, &mut result as *mut _);
            if ret < 0 {
                return Err(anyhow!(
                    "ioctl(WAIT) failed: {}",
                    std::io::Error::last_os_error()
                ));
            }
        }

        log::info!(
            "Execution complete: status={}, cycles={}",
            result.status,
            result.cycles
        );

        Ok(result)
    }

    /// Export output as DMA-BUF.
    pub fn export_dmabuf(&self) -> Result<DmabufExport> {
        let mut export = DmabufExport {
            fd: -1,
            size: 0,
            width: 0,
            height: 0,
            stride: 0,
            format: 0,
            reserved: [0; 4],
        };

        let cmd = ior(
            GEOMETRY_OS_IOC_MAGIC,
            IOC_DMABUF,
            std::mem::size_of::<DmabufExport>(),
        );

        unsafe {
            let ret = libc::ioctl(self.fd(), cmd as _, &mut export as *mut _);
            if ret < 0 {
                return Err(anyhow!(
                    "ioctl(DMABUF) failed: {}",
                    std::io::Error::last_os_error()
                ));
            }
        }

        if export.fd >= 0 {
            log::info!("DMA-BUF exported: fd={}, size={}", export.fd, export.size);
        }

        Ok(export)
    }

    /// Pin the interaction bus in VRAM at a specific address.
    pub fn pin_bus(&self, gpu_addr: u64) -> Result<()> {
        let cmd = iow(
            GEOMETRY_OS_IOC_MAGIC,
            IOC_PIN_BUS,
            std::mem::size_of::<u64>(),
        );

        unsafe {
            let ret = libc::ioctl(self.fd(), cmd as _, &gpu_addr as *const _);
            if ret < 0 {
                return Err(anyhow!(
                    "ioctl(PIN_BUS) failed: {}",
                    std::io::Error::last_os_error()
                ));
            }
        }

        log::info!("Interaction bus pinned at {:#x}", gpu_addr);
        Ok(())
    }

    /// Update mouse state via direct kernel path.
    pub fn update_mouse(&self, event: &MouseEvent) -> Result<()> {
        let cmd = iow(
            GEOMETRY_OS_IOC_MAGIC,
            IOC_UPDATE_MOUSE,
            std::mem::size_of::<MouseEvent>(),
        );

        unsafe {
            let ret = libc::ioctl(self.fd(), cmd as _, event as *const _);
            if ret < 0 {
                return Err(anyhow!(
                    "ioctl(UPDATE_MOUSE) failed: {}",
                    std::io::Error::last_os_error()
                ));
            }
        }

        Ok(())
    }

    /// Perform hardware VCC attestation.
    pub fn attest(&self, expected_hash: [u32; 8]) -> Result<bool> {
        let mut attest = VccAttest {
            expected_hash,
            status: 0,
            reserved: [0; 7],
        };

        let cmd = iowr(
            GEOMETRY_OS_IOC_MAGIC,
            IOC_ATTEST,
            std::mem::size_of::<VccAttest>(),
        );

        unsafe {
            let ret = libc::ioctl(self.fd(), cmd as _, &mut attest as *mut _);
            if ret < 0 {
                return Err(anyhow!(
                    "ioctl(ATTEST) failed: {}",
                    std::io::Error::last_os_error()
                ));
            }
        }

        Ok(attest.status != 0)
    }

    /// Submit and execute a glyph program in one call.
    pub fn execute(&self, spirv: &[u32], x: u32, y: u32, z: u32) -> Result<GlyphResult> {
        self.submit(spirv, x, y, z)?;
        self.exec()?;
        self.wait()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_struct_sizes() {
        // Verify struct sizes match kernel expectations
        assert_eq!(std::mem::size_of::<GlyphSubmit>(), 48);
        assert_eq!(std::mem::size_of::<GlyphResult>(), 56);
        assert_eq!(std::mem::size_of::<GpuInfo>(), 56);
        assert_eq!(std::mem::size_of::<DmabufExport>(), 40);
        assert_eq!(std::mem::size_of::<MouseEvent>(), 32);
        assert_eq!(std::mem::size_of::<VccAttest>(), 64);
    }

    #[test]
    fn test_ioctl_numbers() {
        // Verify ioctl numbers are computed correctly
        let submit = iow(
            GEOMETRY_OS_IOC_MAGIC,
            IOC_SUBMIT,
            std::mem::size_of::<GlyphSubmit>(),
        );
        let exec = io(GEOMETRY_OS_IOC_MAGIC, IOC_EXEC);
        let wait = ior(
            GEOMETRY_OS_IOC_MAGIC,
            IOC_WAIT,
            std::mem::size_of::<GlyphResult>(),
        );
        let pin = iow(
            GEOMETRY_OS_IOC_MAGIC,
            IOC_PIN_BUS,
            std::mem::size_of::<u64>(),
        );
        let update = iow(
            GEOMETRY_OS_IOC_MAGIC,
            IOC_UPDATE_MOUSE,
            std::mem::size_of::<MouseEvent>(),
        );
        let attest = iowr(
            GEOMETRY_OS_IOC_MAGIC,
            IOC_ATTEST,
            std::mem::size_of::<VccAttest>(),
        );

        assert!(submit > 0);
        assert!(exec > 0);
        assert!(wait > 0);
        assert!(pin > 0);
        assert!(update > 0);
        assert!(attest > 0);
    }
}
