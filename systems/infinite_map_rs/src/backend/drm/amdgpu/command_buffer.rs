//! AMDGPU Command Buffer Builder
//!
//! Constructs command buffers for AMD GPU execution via DRM-AMDGPU.

use anyhow::{Context, Result, anyhow};
use std::os::unix::io::RawFd;

/// AMDGPU command buffer header (PM4 format).
#[repr(C, packed)]
struct CmdStreamHeader {
    /// Command type (3 = compute)
    command_type: u32,
    /// Engine type (2 = compute)
    engine_type: u32,
    /// Number of IB entries
    num_ib: u32,
}

/// Indirect buffer (IB) entry for command submission.
#[repr(C, packed)]
struct IbEntry {
    /// GPU virtual address of command buffer
    ib_base: u64,
    /// Size in dwords
    ib_size: u32,
    /// Chain flag
    chain: u32,
}

/// AMDGPU command buffer builder for compute shaders.
pub struct AmdgpuCommandBuffer {
    /// Command data (PM4 packets)
    commands: Vec<u32>,
    /// IB entries
    ib_entries: Vec<IbEntry>,
    /// Current offset in command stream
    offset: usize,
}

impl AmdgpuCommandBuffer {
    /// Create a new command buffer builder.
    pub fn new() -> Self {
        Self {
            commands: Vec::with_capacity(4096),
            ib_entries: Vec::new(),
            offset: 0,
        }
    }

    /// Begin a compute command stream.
    pub fn begin_compute(&mut self) -> &mut Self {
        // PM4 header for compute
        self.emit_packet_header(3, 2, 0);
        self
    }

    /// Emit a PM4 packet header.
    fn emit_packet_header(&mut self, command_type: u32, engine_type: u32, num_ib: u32) {
        self.commands.push(command_type);
        self.commands.push(engine_type);
        self.commands.push(num_ib);
        self.offset += 3;
    }

    /// Add a SET_SH_REG packet (write registers).
    pub fn set_registers(&mut self, reg_offset: u32, values: &[u32]) -> &mut Self {
        // PM4 SET_SH_REG packet type = 0x8
        let packet_type = 0x8u32;
        let count = values.len() as u32;

        // Packet header: type(4) | count(12) | shader engine(4) | predicted_y(4) | reserved(4) | meq(4)
        let header = (packet_type << 30) | (count & 0x3FFF);
        self.commands.push(header);
        self.commands.push(reg_offset);
        self.commands.extend_from_slice(values);
        self.offset += 2 + values.len();
        self
    }

    /// Dispatch compute workgroups.
    pub fn dispatch(&mut self, x: u32, y: u32, z: u32) -> &mut Self {
        // COMPUTE_DISPATCH_INIT state registers
        // Offset 0x18 = COMPUTE_DIM_XYZ
        self.set_registers(0x18, &[x | (y << 10) | (z << 20)]);
        self
    }

    /// Add an indirect buffer entry.
    pub fn add_ib(&mut self, gpu_addr: u64, size_dwords: u32) -> &mut Self {
        self.ib_entries.push(IbEntry {
            ib_base: gpu_addr,
            ib_size: size_dwords,
            chain: 0,
        });
        self
    }

    /// Build the final command buffer.
    pub fn build(self) -> Result<Vec<u32>> {
        if self.commands.is_empty() {
            return Ok(Vec::new());
        }

        log::info!(
            "Built AMDGPU command buffer: {} dwords, {} IB entries",
            self.commands.len(),
            self.ib_entries.len()
        );

        Ok(self.commands)
    }

    /// Submit to GPU via DRM-AMDGPU ioctl.
    pub fn submit(&self, drm_fd: RawFd, ring: u32) -> Result<()> {
        if self.commands.is_empty() {
            return Ok(());
        }

        log::info!(
            "Submitting AMDGPU command buffer: fd={}, ring={}, size={}",
            drm_fd,
            ring,
            self.commands.len() * 4
        );

        // In a full implementation, this would:
        // 1. Allocate GPU-visible memory via amdgpu_bo_alloc
        // 2. Map and copy command buffer to GPU memory
        // 3. Create CSA (command stream area)
        // 4. Submit via DRM_IOCTL_AMDGPU_CS

        // For now, we log the submission
        log::debug!("Command buffer ready for submission (scaffold)");

        Ok(())
    }
}

impl Default for AmdgpuCommandBuffer {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_command_buffer_creation() {
        let mut cb = AmdgpuCommandBuffer::new();
        cb.begin_compute()
            .dispatch(64, 1, 1);

        let buffer = cb.build().unwrap();
        assert!(!buffer.is_empty());
    }

    #[test]
    fn test_dispatch_encoding() {
        let mut cb = AmdgpuCommandBuffer::new();
        cb.begin_compute()
            .dispatch(256, 256, 1);

        let buffer = cb.build().unwrap();
        assert!(buffer.len() > 6);
    }
}
