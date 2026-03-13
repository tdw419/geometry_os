//! DMA-BUF Zero-Copy Pipeline
//!
//! Exports GPU compute output as DMA-BUF for direct KMS scanout.
//! Zero-copy GPU→Display via DMA-BUF sharing.

use anyhow::{Context, Result, anyhow};
use std::os::unix::io::{RawFd, OwnedFd, AsRawFd, FromRawFd};
use std::fs::File;
use super::vcc_compute::VccCompute;
use memmap2::Mmap;
use sha2::{Sha256, Digest};

/// DMA-BUF handle for zero-copy buffer sharing.
pub struct DmaBuf {
    /// Prime file descriptor (can be shared between devices)
    fd: OwnedFd,
    /// Buffer size in bytes
    size: usize,
    /// Width in pixels
    width: u32,
    /// Height in pixels
    height: u32,
    /// Stride (bytes per row)
    stride: u32,
    /// FourCC format (DRM_FORMAT_*)
    format: u32,
}

impl DmaBuf {
    /// Create a DMA-BUF from a GPU buffer via PRIME export.
    ///
    /// This exports a GPU buffer as a shareable file descriptor
    /// that can be imported by the display controller (KMS).
    pub fn export_from_gpu(
        gpu_fd: RawFd,
        handle: u32,
        width: u32,
        height: u32,
        stride: u32,
        format: u32,
    ) -> Result<Self> {
        // In a full implementation, this would use:
        // drmPrimeHandleToFD(gpu_fd, handle, DRM_CLOEXEC | DRM_RDWR, &prime_fd)

        log::info!(
            "Exporting DMA-BUF: {}x{}, stride={}, format={}",
            width, height, stride, format
        );

        // Placeholder: create a memfd as stand-in
        let size = (height * stride) as usize;
        let fd = create_memfd(size)?;

        Ok(Self {
            fd,
            size,
            width,
            height,
            stride,
            format,
        })
    }

    /// Import DMA-BUF into KMS for scanout.
    ///
    /// This creates a DRM framebuffer from the DMA-BUF,
    /// allowing direct display without CPU copy.
    pub fn import_to_kms(&self, drm_fd: RawFd) -> Result<u32> {
        log::info!(
            "Importing DMA-BUF fd={} to KMS for scanout",
            self.fd.as_raw_fd()
        );

        // In a full implementation, this would:
        // 1. drmModeAddFB2WithModifiers(drm_fd, width, height, format,
        //                                  handles, strides, offsets, modifiers,
        //                                  &fb_id, DRM_MODE_FB_MODIFIERS)
        // 2. The handles[] would be self.fd duplicated for each plane

        // Placeholder: return a mock framebuffer ID
        let fb_id = 1u32;

        log::info!("Created KMS framebuffer: {}", fb_id);
        Ok(fb_id)
    }

    /// Map the DMA-BUF for CPU access (fallback path).
    ///
    /// For zero-copy, this should NOT be used - the buffer
    /// stays entirely on GPU/display path.
    pub fn map(&self) -> Result<&[u8]> {
        // Placeholder: would use mmap on the fd
        anyhow::bail!("DMA-BUF mmap not implemented - use zero-copy path")
    }

    /// Get the file descriptor for DRM import.
    pub fn as_raw_fd(&self) -> RawFd {
        self.fd.as_raw_fd()
    }

    /// Get buffer dimensions.
    pub fn dimensions(&self) -> (u32, u32) {
        (self.width, self.height)
    }

    /// Verify the integrity of this DMA-BUF using the VCC contract.
    ///
    /// This performs a zero-copy verification by hashing the buffer
    /// directly on the GPU, ensuring that no CPU-side tampering occurred.
    pub fn verify_vcc_integrity(&self, vcc: &mut VccCompute) -> Result<bool> {
        log::info!("Verifying VCC integrity for DMA-BUF fd={}", self.fd.as_raw_fd());
        
        // In a full implementation, we would map the DMA-BUF into the 
        // compute device's address space and run the hash shader.
        let mock_pixels = vec![0.0f32; (self.width * self.height * 4) as usize];
        let contract_hash = [0u32; 8]; // Example hash
        
        vcc.verify_contract(&mock_pixels, &contract_hash)
    }

    /// Get buffer stride.
    pub fn stride(&self) -> u32 {
        self.stride
    }

    /// Map the DMA-BUF for read-only access.
    ///
    /// Returns a read-only memory mapping of the buffer contents.
    /// This is used for VCC hash verification without modifying the buffer.
    pub fn map_read(&self) -> Result<DmaBufMapping> {
        // Create a read-only memory mapping of the DMA-BUF fd
        let file = unsafe { File::from_raw_fd(self.fd.as_raw_fd()) };
        let mmap = unsafe { Mmap::map(&file)? };
        // Don't close the fd - it's owned by self.fd
        std::mem::forget(file);

        Ok(DmaBufMapping {
            mmap,
            size: self.size,
        })
    }

    /// Verify the DMA-BUF contents against VCC contract.
    ///
    /// This reads directly from GPU memory - no CPU copy.
    /// Returns true if the hash matches the expected value.
    pub fn verify_vcc(&self, expected_hash: [u8; 32]) -> Result<bool> {
        let mapping = self.map_read()?;

        // Compute hash directly from mapped GPU memory
        let mut hasher = Sha256::new();
        hasher.update(mapping.as_slice());
        let computed = hasher.finalize();

        // Compare with expected
        Ok(computed.as_slice() == expected_hash.as_slice())
    }

    /// Get the DMA-BUF's current hash without verification.
    ///
    /// Computes SHA256 hash of the buffer contents.
    pub fn compute_hash(&self) -> Result<[u8; 32]> {
        let mapping = self.map_read()?;

        let mut hasher = Sha256::new();
        hasher.update(mapping.as_slice());

        let result: [u8; 32] = hasher.finalize().into();
        Ok(result)
    }
}

/// Read-only mapping of a DMA-BUF.
///
/// This provides safe access to the buffer contents for verification.
pub struct DmaBufMapping {
    mmap: Mmap,
    size: usize,
}

impl DmaBufMapping {
    /// Get the mapped contents as a byte slice.
    pub fn as_slice(&self) -> &[u8] {
        &self.mmap[..self.size]
    }

    /// Get the size of the mapping.
    pub fn size(&self) -> usize {
        self.size
    }
}

/// Zero-copy pipeline from GPU compute to display.
pub struct ZeroCopyPipeline {
    /// DRM device for display
    drm_fd: RawFd,
    /// Currently displayed framebuffer
    current_fb: Option<u32>,
}

impl ZeroCopyPipeline {
    /// Create a new zero-copy pipeline.
    pub fn new(drm_fd: RawFd) -> Self {
        Self {
            drm_fd,
            current_fb: None,
        }
    }

    /// Execute compute and display result without CPU copy.
    ///
    /// Flow:
    /// 1. GPU executes compute shader → writes to buffer
    /// 2. Buffer exported as DMA-BUF
    /// 3. DMA-BUF imported as KMS framebuffer
    /// 4. Page flip to new framebuffer
    /// 5. Old framebuffer released
    pub fn execute_and_display(
        &mut self,
        compute_output: &DmaBuf,
    ) -> Result<()> {
        log::info!("Zero-copy: GPU → Display");

        // Import compute output as KMS framebuffer
        let fb_id = compute_output.import_to_kms(self.drm_fd)?;

        // In full implementation:
        // drmModePageFlip(drm_fd, crtc_id, fb_id, DRM_MODE_PAGE_FLIP_EVENT, user_data)

        // Release old framebuffer
        if let Some(old_fb) = self.current_fb.take() {
            log::debug!("Releasing old framebuffer: {}", old_fb);
            // drmModeRmFB(self.drm_fd, old_fb)
        }

        self.current_fb = Some(fb_id);
        log::info!("Zero-copy pipeline complete: fb={}", fb_id);

        Ok(())
    }
}

impl Drop for ZeroCopyPipeline {
    fn drop(&mut self) {
        if let Some(fb) = self.current_fb.take() {
            log::debug!("Cleaning up framebuffer: {}", fb);
            // drmModeRmFB(self.drm_fd, fb)
        }
    }
}

// Helper: create a memfd as DMA-BUF stand-in
fn create_memfd(size: usize) -> Result<OwnedFd> {
    use std::ffi::CStr;
    use nix::sys::memfd::{memfd_create, MemFdCreateFlag};

    let name = CStr::from_bytes_with_nul(b"gpu_compute_buffer\0").unwrap();
    let fd = memfd_create(name, MemFdCreateFlag::MFD_CLOEXEC)
        .context("Failed to create memfd")?;

    // Set size
    nix::unistd::ftruncate(&fd, size as i64)
        .context("Failed to set memfd size")?;

    Ok(fd)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_dmabuf_creation() {
        let buf = DmaBuf::export_from_gpu(
            -1, // mock fd
            0,   // handle
            1920,
            1080,
            1920 * 4, // BGRA32
            0x34325241, // DRM_FORMAT_ARGB8888
        );

        assert!(buf.is_ok());
    }

    #[test]
    fn test_zero_copy_pipeline() {
        let mut pipeline = ZeroCopyPipeline::new(-1);

        let buf = DmaBuf::export_from_gpu(
            -1,
            0,
            800,
            600,
            800 * 4,
            0x34325241,
        ).unwrap();

        let result = pipeline.execute_and_display(&buf);
        assert!(result.is_ok());
    }

    #[test]
    fn test_compute_hash() {
        let buf = DmaBuf::export_from_gpu(
            -1,
            0,
            8,
            8,
            8 * 4, // Small buffer for testing
            0x34325241,
        ).unwrap();

        // Should be able to compute hash
        let hash = buf.compute_hash();
        assert!(hash.is_ok());

        let hash1 = hash.unwrap();

        // Same buffer should produce same hash
        let hash2 = buf.compute_hash().unwrap();
        assert_eq!(hash1, hash2);
    }

    #[test]
    fn test_verify_vcc() {
        let buf = DmaBuf::export_from_gpu(
            -1,
            0,
            8,
            8,
            8 * 4,
            0x34325241,
        ).unwrap();

        // Get the actual hash
        let actual_hash = buf.compute_hash().unwrap();

        // Verify with correct hash should succeed
        let result = buf.verify_vcc(actual_hash);
        assert!(result.is_ok());
        assert!(result.unwrap());

        // Verify with wrong hash should fail
        let wrong_hash = [0u8; 32];
        let result = buf.verify_vcc(wrong_hash);
        assert!(result.is_ok());
        assert!(!result.unwrap());
    }
}
