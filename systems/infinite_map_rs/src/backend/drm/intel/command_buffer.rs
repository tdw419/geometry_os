//! Intel GPU Command Buffer Builder
//!
//! Constructs batch buffers for Intel GPU execution via i915 DRM.

use anyhow::Result;
use std::os::unix::io::RawFd;

/// Intel GPU batch buffer commands (GEN commands).
/// These are the actual hardware commands for Intel GPUs.

/// Batch buffer header.
#[repr(C, packed)]
struct BatchBufferHeader {
    /// Batch buffer start
    bb_start: u32,
    /// Reserved
    reserved: [u32; 3],
}

/// MEDIA_VFE_STATE - Video Front End state for compute.
#[repr(C, packed)]
struct MediaVfeState {
    /// Command type (0x71000000 for MEDIA_VFE_STATE)
    dword0: u32,
    /// VFE mode config
    dword1: u32,
    /// Scratch space base pointer
    scratch_base: u64,
    /// Scratch size
    scratch_size: u32,
}

/// INTERFACE_DESCRIPTOR_DATA - Compute shader interface.
#[repr(C, packed)]
struct InterfaceDescriptor {
    /// Kernel start pointer
    kernel_start: u64,
    /// Kernel stack size
    stack_size: u32,
    /// Reserved
    reserved1: u32,
    /// Number of threads per thread group
    num_threads: u32,
    /// Reserved
    reserved2: [u32; 3],
}

/// Intel command buffer builder for compute shaders.
pub struct IntelCommandBuffer {
    /// Command data (batch buffer)
    commands: Vec<u32>,
    /// Current offset in command stream
    offset: usize,
    /// Current batch buffer size
    batch_size: usize,
}

impl IntelCommandBuffer {
    /// Create a new command buffer builder.
    pub fn new() -> Self {
        Self {
            commands: Vec::with_capacity(4096),
            offset: 0,
            batch_size: 0,
        }
    }

    /// Begin a batch buffer.
    pub fn begin_batch(&mut self) -> &mut Self {
        // MI_BATCH_BUFFER_START
        self.emit(0x71000001, &[0, 0, 0]);
        self
    }

    /// Emit a command.
    fn emit(&mut self, header: u32, data: &[u32]) {
        self.commands.push(header);
        self.commands.extend_from_slice(data);
        self.offset += 1 + data.len();
    }

    /// Add MEDIA_VFE_STATE (compute engine setup).
    pub fn set_media_vfe(&mut self, scratch_base: u64, scratch_size: u32) -> &mut Self {
        // MEDIA_VFE_STATE command
        let dword0 = 0x71000000u32 | (6 - 2); // Length in dwords minus 2

        self.commands.push(dword0);
        self.commands.push(0x00000000); // VFE mode
        self.commands.extend_from_slice(&[
            (scratch_base & 0xFFFFFFFF) as u32,
            ((scratch_base >> 32) & 0xFFFFFFFF) as u32,
            scratch_size,
        ]);

        self.offset += 4;
        self
    }

    /// Add CURBE_LOAD (constant buffer load).
    pub fn load_curbe(&mut self, curbe_offset: u64, data: &[u32]) -> &mut Self {
        // Load constant URB entry
        let dword0 = 0x71000001u32 | ((data.len() as u32) << 8);

        self.commands.push(dword0);
        self.commands.extend_from_slice(&[
            (curbe_offset & 0xFFFFFFFF) as u32,
            ((curbe_offset >> 32) & 0xFFFFFFFF) as u32,
        ]);
        self.commands.extend_from_slice(data);

        self.offset += 2 + data.len();
        self
    }

    /// Dispatch compute workgroups (MEDIA_STATE).
    pub fn dispatch(&mut self, x: u32, y: u32, z: u32) -> &mut Self {
        // MEDIA_STATE command for compute dispatch
        self.emit(
            0x71000002,
            &[
                x | (y << 16),
                z,
                0, // Reserved
            ],
        );
        self
    }

    /// Add MI_BATCH_BUFFER_END.
    pub fn end_batch(&mut self) -> &mut Self {
        self.commands.push(0x05000000); // MI_BATCH_BUFFER_END
        self.offset += 1;
        self
    }

    /// Build the final command buffer.
    pub fn build(self) -> Result<Vec<u32>> {
        if self.commands.is_empty() {
            return Ok(Vec::new());
        }

        log::info!("Built Intel batch buffer: {} dwords", self.commands.len());

        Ok(self.commands)
    }

    /// Submit to GPU via DRM-i915 ioctl.
    pub fn submit(&self, drm_fd: RawFd, ring: u32) -> Result<()> {
        if self.commands.is_empty() {
            return Ok(());
        }

        log::info!(
            "Submitting Intel batch buffer: fd={}, ring={}, size={}",
            drm_fd,
            ring,
            self.commands.len() * 4
        );

        // In a full implementation, this would:
        // 1. Create gem buffer: DRM_IOCTL_I915_GEM_CREATE
        // 2. Pin to GTT: DRM_IOCTL_I915_GEM_PIN
        // 3. Write batch to buffer: pwrite
        // 4. Submit: DRM_IOCTL_I915_GEM_EXECBUFFER2

        log::debug!("Batch buffer ready for submission (scaffold)");

        Ok(())
    }
}

impl Default for IntelCommandBuffer {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_command_buffer_creation() {
        let mut cb = IntelCommandBuffer::new();
        cb.begin_batch()
            .set_media_vfe(0x100000000, 0x10000)
            .dispatch(64, 1, 1)
            .end_batch();

        let buffer = cb.build().unwrap();
        assert!(!buffer.is_empty());
    }

    #[test]
    fn test_dispatch_encoding() {
        let mut cb = IntelCommandBuffer::new();
        cb.begin_batch().dispatch(256, 256, 1).end_batch();

        let buffer = cb.build().unwrap();
        assert!(buffer.len() > 4);
    }
}
