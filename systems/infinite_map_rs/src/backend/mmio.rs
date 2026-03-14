//! GPU MMIO (Memory-Mapped I/O) Interface
//!
//! Direct register access for GPU control.

use anyhow::{Context, Result, anyhow};
use std::fs::OpenOptions;
use std::os::unix::io::{AsRawFd, RawFd};
use std::ptr;

/// MMIO region for GPU register access.
pub struct MmioRegion {
    /// Base address of MMIO region
    base: *mut u32,
    /// Size of MMIO region
    size: usize,
    /// File descriptor for /dev/mem
    fd: RawFd,
}

impl MmioRegion {
    /// Create an unmaped MMIO region (for testing).
    pub fn unmaped() -> Self {
        Self {
            base: ptr::null_mut(),
            size: 0,
            fd: -1,
        }
    }

    /// Map GPU MMIO region via /dev/mem.
    ///
    /// # Safety
    /// Requires root privileges and valid physical address.
    pub unsafe fn map(phys_addr: u64, size: usize) -> Result<Self> {
        // Open /dev/mem
        let file = OpenOptions::new()
            .read(true)
            .write(true)
            .open("/dev/mem")
            .context("Failed to open /dev/mem (requires root)")?;

        let fd = file.as_raw_fd();
        std::mem::forget(file); // Don't close fd

        // Map physical memory
        let base = libc::mmap(
            ptr::null_mut(),
            size,
            libc::PROT_READ | libc::PROT_WRITE,
            libc::MAP_SHARED,
            fd,
            phys_addr as i64,
        );

        if base == libc::MAP_FAILED {
            return Err(anyhow!("mmap failed for MMIO region"));
        }

        log::info!(
            "Mapped MMIO: phys={:#x}, size={:#x}, virt={:#x}",
            phys_addr,
            size,
            base as usize
        );

        Ok(Self {
            base: base as *mut u32,
            size,
            fd,
        })
    }

    /// Check if region is mapped.
    pub fn is_mapped(&self) -> bool {
        !self.base.is_null()
    }

    /// Read 32-bit register.
    #[inline]
    pub fn read32(&self, offset: usize) -> u32 {
        if self.base.is_null() {
            return 0;
        }
        unsafe {
            volatile_load(self.base.add(offset / 4))
        }
    }

    /// Write 32-bit register.
    #[inline]
    pub fn write32(&self, offset: usize, value: u32) {
        if self.base.is_null() {
            return;
        }
        unsafe {
            volatile_store(self.base.add(offset / 4), value);
        }
    }

    /// Read 64-bit register.
    #[inline]
    pub fn read64(&self, offset: usize) -> u64 {
        let lo = self.read32(offset) as u64;
        let hi = self.read32(offset + 4) as u64;
        (hi << 32) | lo
    }

    /// Write 64-bit register.
    #[inline]
    pub fn write64(&self, offset: usize, value: u64) {
        self.write32(offset, (value & 0xFFFFFFFF) as u32);
        self.write32(offset + 4, ((value >> 32) & 0xFFFFFFFF) as u32);
    }

    /// Set bits in register.
    #[inline]
    pub fn set_bits(&self, offset: usize, mask: u32) {
        let val = self.read32(offset);
        self.write32(offset, val | mask);
    }

    /// Clear bits in register.
    #[inline]
    pub fn clear_bits(&self, offset: usize, mask: u32) {
        let val = self.read32(offset);
        self.write32(offset, val & !mask);
    }

    /// Wait for register bits to be set.
    pub fn wait_set(&self, offset: usize, mask: u32, timeout_us: u64) -> Result<()> {
        let start = std::time::Instant::now();
        loop {
            if (self.read32(offset) & mask) == mask {
                return Ok(());
            }
            if start.elapsed().as_micros() as u64 > timeout_us {
                return Err(anyhow!("MMIO wait timeout at offset {:#x}", offset));
            }
            std::thread::yield_now();
        }
    }

    /// Wait for register bits to be clear.
    pub fn wait_clear(&self, offset: usize, mask: u32, timeout_us: u64) -> Result<()> {
        let start = std::time::Instant::now();
        loop {
            if (self.read32(offset) & mask) == 0 {
                return Ok(());
            }
            if start.elapsed().as_micros() as u64 > timeout_us {
                return Err(anyhow!("MMIO wait timeout at offset {:#x}", offset));
            }
            std::thread::yield_now();
        }
    }
}

impl Drop for MmioRegion {
    fn drop(&mut self) {
        if !self.base.is_null() && self.fd >= 0 {
            unsafe {
                libc::munmap(self.base as *mut _, self.size);
                libc::close(self.fd);
            }
        }
    }
}

/// Volatile load (prevents compiler optimization).
#[inline(always)]
unsafe fn volatile_load<T>(src: *const T) -> T {
    std::ptr::read_volatile(src)
}

/// Volatile store (prevents compiler optimization).
#[inline(always)]
unsafe fn volatile_store<T>(dst: *mut T, val: T) {
    std::ptr::write_volatile(dst, val);
}

/// GPU PCI device information.
#[derive(Debug, Clone)]
pub struct PciDevice {
    pub vendor_id: u16,
    pub device_id: u16,
    pub bus: u8,
    pub slot: u8,
    pub function: u8,
    pub bar0_addr: u64,
    pub bar0_size: u64,
}

/// Find GPU PCI device.
pub fn find_gpu() -> Result<PciDevice> {
    // Read /sys/bus/pci/devices for GPU
    let devices = std::fs::read_dir("/sys/bus/pci/devices")
        .context("Failed to read PCI devices")?;

    for entry in devices {
        let path = entry?.path();
        let vendor_path = path.join("vendor");
        let class_path = path.join("class");

        if let (Ok(vendor), Ok(class)) = (
            std::fs::read_to_string(&vendor_path),
            std::fs::read_to_string(&class_path),
        ) {
            // Check if display device (class 0x03xxxx)
            let class_val = u32::from_str_radix(class.trim().trim_start_matches("0x"), 16)
                .unwrap_or(0);

            if (class_val >> 16) == 0x03 {
                let vendor_val = u16::from_str_radix(
                    vendor.trim().trim_start_matches("0x"),
                    16
                ).unwrap_or(0);

                // AMD = 0x1002, Intel = 0x8086, NVIDIA = 0x10DE
                if vendor_val == 0x1002 || vendor_val == 0x8086 || vendor_val == 0x10DE {
                    // Parse BDF from path
                    let name = path.file_name().unwrap().to_string_lossy();
                    let parts: Vec<&str> = name.split(':').collect();

                    let (bus, slot, func) = if parts.len() >= 3 {
                        // Format: 0000:00:02.0 (domain:bus:slot.function)
                        let slot_func = parts[2].split('.').collect::<Vec<&str>>();
                        let slot = slot_func.get(0).and_then(|s| u8::from_str_radix(s, 16).ok()).unwrap_or(0);
                        let func = slot_func.get(1).and_then(|s| u8::from_str_radix(s, 16).ok()).unwrap_or(0);
                        (
                            u8::from_str_radix(parts[1], 16).unwrap_or(0),
                            slot,
                            func,
                        )
                    } else {
                        (0, 0, 0)
                    };

                    // Read BAR0
                    let resource_path = path.join("resource0");
                    let bar0_size = if resource_path.exists() {
                        std::fs::metadata(&resource_path)?.len()
                    } else {
                        0x1000000 // Default 16MB
                    };

                    // Read BAR0 address from resource
                    let resource = std::fs::read_to_string(path.join("resource"))
                        .unwrap_or_default();
                    let bar0_addr = resource.lines().next()
                        .and_then(|line| {
                            let parts: Vec<&str> = line.split_whitespace().collect();
                            if parts.len() >= 2 {
                                Some(u64::from_str_radix(parts[0].trim_start_matches("0x"), 16)
                                    .unwrap_or(0))
                            } else {
                                None
                            }
                        })
                        .unwrap_or(0);

                    return Ok(PciDevice {
                        vendor_id: vendor_val,
                        device_id: u16::from_str_radix(
                            &std::fs::read_to_string(path.join("device"))
                                .unwrap_or_default()
                                .trim()
                                .trim_start_matches("0x"),
                            16
                        ).unwrap_or(0),
                        bus,
                        slot,
                        function: func,
                        bar0_addr,
                        bar0_size,
                    });
                }
            }
        }
    }

    Err(anyhow!("No GPU found"))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_find_gpu() {
        // This test requires a GPU to be present
        if let Ok(gpu) = find_gpu() {
            println!("Found GPU: {:?}", gpu);
            assert!(gpu.vendor_id == 0x1002 || gpu.vendor_id == 0x8086 || gpu.vendor_id == 0x10DE);
        } else {
            println!("No GPU found (may be expected in CI)");
        }
    }

    #[test]
    fn test_mmio_region_unmapped() {
        let mmio = MmioRegion::unmaped();
        assert!(!mmio.is_mapped());
        // Reads/writes on unmapped region should be safe no-ops
        assert_eq!(mmio.read32(0), 0);
        mmio.write32(0, 0x12345678); // Should not crash
    }
}
