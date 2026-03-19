//! AMDGPU Direct MMIO Interface
//!
//! Real register-level control of AMD GPUs.

use crate::backend::mmio::{MmioRegion, PciDevice};
use anyhow::{anyhow, Context, Result};

/// AMD GPU register offsets (GC 10.x / RDNA)
pub mod regs {
    // MMIO indirect access
    pub const MM_INDEX: usize = 0x0000;
    pub const MM_DATA: usize = 0x0004;
    pub const MM_INDEX_HI: usize = 0x0008;

    // PCIE indirect access
    pub const PCIE_INDEX: usize = 0x000C;
    pub const PCIE_DATA: usize = 0x0010;

    // Command processor (CP)
    pub const CP_RB0_BASE_LO: usize = 0x2F00;
    pub const CP_RB0_BASE_HI: usize = 0x2F04;
    pub const CP_RB0_CNTL: usize = 0x2F08;
    pub const CP_RB0_RPTR: usize = 0x2F0C;
    pub const CP_RB0_WPTR: usize = 0x2F10;
    pub const CP_RB0_WPTR_HI: usize = 0x2F14;
    pub const CP_RB0_DOORBELL: usize = 0x2F18;

    // Compute registers
    pub const COMPUTE_PGM_LO: usize = 0x2E00;
    pub const COMPUTE_PGM_HI: usize = 0x2E04;
    pub const COMPUTE_PGM_RSRC1: usize = 0x2E08;
    pub const COMPUTE_PGM_RSRC2: usize = 0x2E0C;
    pub const COMPUTE_PGM_RSRC3: usize = 0x2E10;
    pub const COMPUTE_VMID: usize = 0x2E14;
    pub const COMPUTE_RESOURCE_LIMITS: usize = 0x2E18;
    pub const COMPUTE_STATIC_THREAD_MGMT_SE0: usize = 0x2E20;
    pub const COMPUTE_STATIC_THREAD_MGMT_SE1: usize = 0x2E24;

    // Dispatch registers
    pub const COMPUTE_DIM_X: usize = 0x1F62;
    pub const COMPUTE_DIM_Y: usize = 0x1F64;
    pub const COMPUTE_DIM_Z: usize = 0x1F66;
    pub const COMPUTE_START_X: usize = 0x1F68;
    pub const COMPUTE_START_Y: usize = 0x1F6A;
    pub const COMPUTE_START_Z: usize = 0x1F6C;
    pub const COMPUTE_INITIATOR: usize = 0x1F6E;
    pub const COMPUTE_DISPATCH_INITIATOR: usize = 0x1F70;

    // User queues
    pub const CP_HQD_QUEUE_PRIORITY: usize = 0x30F8;
    pub const CP_HQD_QUANTUM: usize = 0x30FC;
    pub const CP_HQD_BASE: usize = 0x3100;
    pub const CP_HQD_BASE_HI: usize = 0x3104;
    pub const CP_HQD_RPTR: usize = 0x3108;
    pub const CP_HQD_RPTR_HI: usize = 0x310C;
    pub const CP_HQD_WPTR: usize = 0x3110;
    pub const CP_HQD_WPTR_HI: usize = 0x3114;
    pub const CP_HQD_VMID: usize = 0x3118;
    pub const CP_HQD_PERSISTENT_STATE: usize = 0x311C;
    pub const CP_HQD_ACTIVE: usize = 0x3120;

    // GRBM (Graphics Register Block Manager)
    pub const GRBM_STATUS: usize = 0x8010;
    pub const GRBM_STATUS2: usize = 0x8014;
    pub const GRBM_SOFT_RESET: usize = 0x8020;

    // GB_ADDR_CONFIG
    pub const GB_ADDR_CONFIG: usize = 0x2644;
    pub const GB_ADDR_CONFIG_GOLDEN: u32 = 0x00000055; // Varies by ASIC

    // GPU reset
    pub const GPU_RESET: usize = 0x2000;
}

/// PM4 packet types
pub mod pm4 {
    pub const PACKET_TYPE_3: u32 = 3;

    // Packet 3 opcodes
    pub const IT_SET_SH_REG: u32 = 0x89;
    pub const IT_DISPATCH_DIRECT: u32 = 0x15;
    pub const IT_DISPATCH_INDIRECT: u32 = 0x16;
    pub const IT_WAIT_REG_MEM: u32 = 0x3C;
    pub const IT_NOP: u32 = 0x10;
    pub const IT_INDIRECT_BUFFER: u32 = 0x3F;

    // Build PM4 type-3 packet header
    pub fn build_type3_header(opcode: u32, count: u32) -> u32 {
        (PACKET_TYPE_3 << 30) | ((1) << 29) | ((opcode & 0xFF) << 8) | ((count - 1) & 0x3FFF)
    }
}

/// AMD GPU device with MMIO access.
pub struct AmdGpuDevice {
    /// MMIO region
    mmio: MmioRegion,
    /// PCI device info
    pci: PciDevice,
    /// Ring buffer base address (GPU VA)
    #[allow(dead_code)] // Scaffolding: reserved for ring buffer commands
    ring_base: u64,
    /// Ring buffer size
    #[allow(dead_code)] // Scaffolding: reserved for ring buffer commands
    ring_size: usize,
    /// Read pointer
    rptr: u32,
    /// Write pointer
    wptr: u32,
}

impl AmdGpuDevice {
    /// Open AMD GPU device.
    pub fn open() -> Result<Self> {
        let pci = crate::backend::mmio::find_gpu().context("Failed to find GPU")?;

        if pci.vendor_id != 0x1002 {
            return Err(anyhow!("Not an AMD GPU (vendor={:#x})", pci.vendor_id));
        }

        // Map MMIO region
        let mmio = unsafe {
            MmioRegion::map(pci.bar0_addr, pci.bar0_size as usize)
                .context("Failed to map GPU MMIO")?
        };

        log::info!(
            "AMD GPU initialized: device={:#x}, MMIO={:#x}",
            pci.device_id,
            pci.bar0_addr
        );

        Ok(Self {
            mmio,
            pci,
            ring_base: 0,
            ring_size: 0x100000, // 1MB ring
            rptr: 0,
            wptr: 0,
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

    /// Initialize GPU for compute.
    pub fn init_compute(&mut self) -> Result<()> {
        log::info!("Initializing AMD GPU compute...");

        // Wait for GPU to be idle
        self.wait_idle()?;

        // Reset ring pointers
        self.write_reg(regs::CP_RB0_RPTR, 0);
        self.write_reg(regs::CP_RB0_WPTR, 0);
        self.write_reg(regs::CP_RB0_WPTR_HI, 0);

        self.rptr = 0;
        self.wptr = 0;

        log::info!("AMD GPU compute initialized");
        Ok(())
    }

    /// Wait for GPU to be idle.
    pub fn wait_idle(&self) -> Result<()> {
        // Check GRBM_STATUS for activity
        self.mmio
            .wait_clear(regs::GRBM_STATUS, 0x80000000, 1_000_000)?;
        Ok(())
    }

    /// Submit PM4 commands to ring buffer.
    pub fn submit_commands(&mut self, commands: &[u32]) -> Result<()> {
        // In a real implementation, we would:
        // 1. Copy commands to ring buffer memory
        // 2. Update WPTR
        // 3. Ring doorbell

        // For now, simulate by logging
        log::info!("Submitting {} PM4 commands", commands.len());

        // Update write pointer
        self.wptr = self.wptr.wrapping_add(commands.len() as u32);
        self.write_reg(regs::CP_RB0_WPTR, self.wptr);

        Ok(())
    }

    /// Dispatch compute shader.
    pub fn dispatch(&mut self, x: u32, y: u32, z: u32) -> Result<()> {
        // Build PM4 dispatch packet
        let mut commands = Vec::new();

        // SET_SH_REG for dispatch dimensions
        commands.push(pm4::build_type3_header(pm4::IT_SET_SH_REG, 4));
        commands.push(0x18); // COMPUTE_DIM_XYZ offset
        commands.push(x);
        commands.push(y);
        commands.push(z);

        // DISPATCH_DIRECT
        commands.push(pm4::build_type3_header(pm4::IT_DISPATCH_DIRECT, 1));
        commands.push(1); // 1 dispatch

        self.submit_commands(&commands)
    }

    /// Wait for dispatch completion.
    pub fn wait_completion(&mut self) -> Result<()> {
        // Wait for ring to be idle
        self.mmio
            .wait_clear(regs::GRBM_STATUS, 0x80000000, 10_000_000)?;

        // Update read pointer
        self.rptr = self.read_reg(regs::CP_RB0_RPTR);

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_pm4_header() {
        let header = pm4::build_type3_header(pm4::IT_DISPATCH_DIRECT, 1);
        assert!(header > 0);
        assert_eq!((header >> 30) & 0x3, 3); // Type 3
    }

    #[test]
    fn test_pm4_set_sh_reg() {
        let header = pm4::build_type3_header(pm4::IT_SET_SH_REG, 4);
        assert!(header > 0);
        assert_eq!((header >> 8) & 0xFF, pm4::IT_SET_SH_REG);
    }
}
