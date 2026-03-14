//! Intel i915 MMIO Interface
//!
//! Real register-level control of Intel GPUs.

use anyhow::{Context, Result, anyhow};
use crate::backend::mmio::{MmioRegion, PciDevice};

/// Intel GPU register offsets (Gen9/Gen11/Xe)
pub mod regs {
    // Forcewake (required for register access)
    pub const FORCEWAKE_MT: usize = 0xA188;
    pub const FORCEWAKE_MT_ACK: usize = 0xA190;

    // RCS (Render Command Streamer)
    pub const RCS_RING_TAIL: usize = 0x2000;
    pub const RCS_RING_HEAD: usize = 0x2004;
    pub const RCS_RING_START: usize = 0x2008;
    pub const RCS_RING_CTL: usize = 0x200C;

    // VCS0 (Video Command Streamer 0)
    pub const VCS0_RING_TAIL: usize = 0x1C000;
    pub const VCS0_RING_HEAD: usize = 0x1C004;
    pub const VCS0_RING_START: usize = 0x1C008;
    pub const VCS0_RING_CTL: usize = 0x1C00C;

    // BCS (Blitter Command Streamer)
    pub const BCS_RING_TAIL: usize = 0x22000;
    pub const BCS_RING_HEAD: usize = 0x22004;
    pub const BCS_RING_START: usize = 0x22008;
    pub const BCS_RING_CTL: usize = 0x2200C;

    // VECS (Video Enhancement Command Streamer)
    pub const VECS_RING_TAIL: usize = 0x1E000;
    pub const VECS_RING_HEAD: usize = 0x1E004;
    pub const VECS_RING_START: usize = 0x1E008;
    pub const VECS_RING_CTL: usize = 0x1E00C;

    // Batch buffer
    pub const BB_ADDR: usize = 0x2140;
    pub const BB_STATE: usize = 0x2150;

    // HWS (Hardware Status Page)
    pub const HWS_PGA: usize = 0x2080;

    // GFX interrupt
    pub const GT_INTR_DW0: usize = 0x4400;
    pub const GT_INTR_DW1: usize = 0x4404;

    // Reset
    pub const GDRST: usize = 0x941C;
}

/// Command streamer types
#[derive(Debug, Clone, Copy)]
pub enum CommandStreamer {
    /// Render Command Streamer
    RCS = 0,
    /// Video Command Streamer
    VCS = 1,
    /// Blitter Command Streamer
    BCS = 2,
    /// Video Enhancement Command Streamer
    VECS = 3,
}

/// Intel GPU device with MMIO access.
pub struct IntelGpuMmioDevice {
    /// MMIO region
    mmio: MmioRegion,
    /// PCI device info
    pci: PciDevice,
    /// Active command streamer
    cs: CommandStreamer,
}

impl IntelGpuMmioDevice {
    /// Open Intel GPU device.
    pub fn open() -> Result<Self> {
        let pci = crate::backend::mmio::find_gpu()
            .context("Failed to find GPU")?;

        if pci.vendor_id != 0x8086 {
            return Err(anyhow!("Not an Intel GPU (vendor={:#x})", pci.vendor_id));
        }

        // Map MMIO region
        let mmio = unsafe {
            MmioRegion::map(pci.bar0_addr, pci.bar0_size as usize)
                .context("Failed to map GPU MMIO")?
        };

        log::info!(
            "Intel GPU initialized: device={:#x}, MMIO={:#x}",
            pci.device_id,
            pci.bar0_addr
        );

        Ok(Self {
            mmio,
            pci,
            cs: CommandStreamer::RCS,
        })
    }

    /// Get device ID.
    pub fn device_id(&self) -> u16 {
        self.pci.device_id
    }

    /// Read MMIO register.
    pub fn read_reg(&self, offset: usize) -> u32 {
        self.mmio.read32(offset)
    }

    /// Write MMIO register.
    pub fn write_reg(&self, offset: usize, value: u32) {
        self.mmio.write32(offset, value);
    }

    /// Acquire forcewake for register access.
    pub fn forcewake_acquire(&self) -> Result<()> {
        // Request forcewake
        self.write_reg(regs::FORCEWAKE_MT, 0x00010001);

        // Wait for acknowledgment
        self.mmio.wait_set(regs::FORCEWAKE_MT_ACK, 0x00010001, 1000)?;

        Ok(())
    }

    /// Release forcewake.
    pub fn forcewake_release(&self) -> Result<()> {
        self.write_reg(regs::FORCEWAKE_MT, 0x00010000);
        self.mmio.wait_clear(regs::FORCEWAKE_MT_ACK, 0x00010001, 1000)?;
        Ok(())
    }

    /// Wait for GPU to be idle.
    pub fn wait_idle(&self) -> Result<()> {
        let offsets = self.ring_offsets();
        let head_reg = offsets.1;
        let tail_reg = offsets.0;

        self.forcewake_acquire()?;

        // Wait for head == tail (ring empty)
        for _ in 0..1000 {
            let head = self.read_reg(head_reg) & 0x001FFFFC;
            let tail = self.read_reg(tail_reg) & 0x001FFFFC;
            if head == tail {
                self.forcewake_release()?;
                return Ok(());
            }
            std::thread::yield_now();
        }

        self.forcewake_release()?;
        Err(anyhow!("GPU wait idle timeout"))
    }

    /// Initialize ring buffer.
    pub fn init_ring(&mut self, ring_base: u64, ring_size: u32) -> Result<()> {
        self.forcewake_acquire()?;

        let offsets = self.ring_offsets();
        let (tail_reg, _, start_reg, ctl_reg) = offsets;

        // Set ring buffer base
        self.write_reg(start_reg, ring_base as u32);

        // Set ring control (size = ring_size / 4096 - 1)
        let ctl = ((ring_size / 4096 - 1) << 12) | 1; // Enable
        self.write_reg(ctl_reg, ctl);

        // Clear tail
        self.write_reg(tail_reg, 0);

        self.forcewake_release()?;

        log::info!("Ring initialized: base={:#x}, size={}", ring_base, ring_size);
        Ok(())
    }

    /// Submit batch buffer.
    pub fn submit_batch(&mut self, batch_addr: u64, batch_size: u32) -> Result<()> {
        self.forcewake_acquire()?;

        // Set batch buffer address
        self.write_reg(regs::BB_ADDR, batch_addr as u32);

        // Trigger execution
        self.write_reg(regs::BB_STATE, batch_size);

        self.forcewake_release()?;

        // Wait for completion
        self.wait_idle()?;

        Ok(())
    }

    /// Get ring register offsets for current command streamer.
    fn ring_offsets(&self) -> (usize, usize, usize, usize) {
        match self.cs {
            CommandStreamer::RCS => (
                regs::RCS_RING_TAIL,
                regs::RCS_RING_HEAD,
                regs::RCS_RING_START,
                regs::RCS_RING_CTL,
            ),
            CommandStreamer::VCS => (
                regs::VCS0_RING_TAIL,
                regs::VCS0_RING_HEAD,
                regs::VCS0_RING_START,
                regs::VCS0_RING_CTL,
            ),
            CommandStreamer::BCS => (
                regs::BCS_RING_TAIL,
                regs::BCS_RING_HEAD,
                regs::BCS_RING_START,
                regs::BCS_RING_CTL,
            ),
            CommandStreamer::VECS => (
                regs::VECS_RING_TAIL,
                regs::VECS_RING_HEAD,
                regs::VECS_RING_START,
                regs::VECS_RING_CTL,
            ),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_command_streamer() {
        assert_eq!(CommandStreamer::RCS as usize, 0);
        assert_eq!(CommandStreamer::VCS as usize, 1);
    }

    #[test]
    fn test_ring_offsets_rcs() {
        let cs = CommandStreamer::RCS;
        let tail = match cs {
            CommandStreamer::RCS => regs::RCS_RING_TAIL,
            _ => 0,
        };
        assert_eq!(tail, 0x2000);
    }
}
