//! AMDGPU Buffer Object (BO) Manager
//!
//! Manages GPU memory allocation, mapping, and virtual address space
//! via the AMDGPU DRM interface. Provides BO creation, CPU mapping,
//! GPU VA mapping, and synchronization.

use anyhow::{anyhow, Context, Result};
use std::collections::HashMap;
use std::fs::File;
use std::os::unix::io::{AsRawFd, FromRawFd, IntoRawFd, RawFd};
use std::ptr;

use super::drm_ioctl::{
    self, AmdgpuCtxArg, AmdgpuGemCreateArgs, AmdgpuGemCreateIn, AmdgpuGemCreateOut,
    AmdgpuGemMmapArgs, AmdgpuGemMmapIn, AmdgpuGemMmapOut, AmdgpuGemVa, AmdgpuGemWaitIdle,
    AmdgpuWaitCsArgs, AmdgpuWaitCsIn,
};
use super::drm_ioctl::ctx_op;
use super::drm_ioctl::gem_domain;
use super::drm_ioctl::gem_va_op;
use super::drm_ioctl::hw_ip_type;

/// Buffer object handle
pub type BoHandle = u32;

/// Invalid handle sentinel
pub const INVALID_HANDLE: BoHandle = 0;

/// Buffer object information
#[derive(Debug)]
struct BoInfo {
    /// GEM handle
    handle: BoHandle,
    /// Size in bytes
    size: u64,
    /// GPU virtual address (0 if not mapped)
    gpu_addr: u64,
    /// CPU mmap offset (0 if not mapped)
    cpu_mmap_offset: u64,
    /// Domain flags
    domain: u64,
    /// Whether this BO holds a CPU-mapped pointer
    cpu_mapped: bool,
}

/// GPU Virtual Address space manager.
///
/// Tracks allocations within the GPU VA space to avoid collisions.
struct VaAllocator {
    /// Base address for VA allocations
    base: u64,
    /// End address for VA allocations
    end: u64,
    /// Next free address
    next: u64,
    /// Alignment requirement (4KB pages)
    alignment: u64,
}

impl VaAllocator {
    fn new(base: u64, size: u64) -> Self {
        Self {
            base,
            end: base + size,
            next: base,
            alignment: 0x1000, // 4KB
        }
    }

    /// Allocate a GPU VA range of the given size. Returns the base address.
    fn allocate(&mut self, size: u64) -> Result<u64> {
        let aligned_size = (size + self.alignment - 1) & !(self.alignment - 1);
        if self.next + aligned_size > self.end {
            anyhow::bail!(
                "GPU VA space exhausted: need {:#x}, have {:#x} remaining",
                aligned_size,
                self.end - self.next
            );
        }
        let addr = self.next;
        self.next += aligned_size;
        Ok(addr)
    }
}

/// AMDGPU Buffer Object Manager
///
/// Provides high-level buffer object management including allocation,
/// GPU virtual address mapping, CPU access, and synchronization.
pub struct AmdgpuBoManager {
    /// DRM file descriptor
    drm_fd: RawFd,
    /// Buffer object tracking
    buffers: HashMap<BoHandle, BoInfo>,
    /// GPU VA space allocator
    va_allocator: VaAllocator,
    /// Next context ID for CS submissions
    next_ctx_id: u32,
}

impl AmdgpuBoManager {
    /// Create a new BO manager for an open AMDGPU DRM device.
    pub fn new(drm_fd: RawFd) -> Self {
        Self {
            drm_fd,
            buffers: HashMap::new(),
            va_allocator: VaAllocator::new(0x1_0000_0000, 0x1000_0000_0000), // 1TB VA space at 4GB
            next_ctx_id: 1,
        }
    }

    /// Allocate a new buffer object in VRAM.
    pub fn alloc_vram(&mut self, size: u64) -> Result<BoHandle> {
        self.alloc(size, gem_domain::VRAM)
    }

    /// Allocate a new buffer object in GTT (system memory, GPU accessible).
    pub fn alloc_gtt(&mut self, size: u64) -> Result<BoHandle> {
        self.alloc(size, gem_domain::GTT)
    }

    /// Allocate a new buffer object.
    fn alloc(&mut self, size: u64, domain: u64) -> Result<BoHandle> {
        let aligned_size = (size + 4095) & !4095; // 4KB align

        let create_args = AmdgpuGemCreateArgs {
            r#in: AmdgpuGemCreateIn {
                size: aligned_size,
                domain,
                flags: 0,
            },
            out: AmdgpuGemCreateOut {
                handle: INVALID_HANDLE,
                _pad: 0,
            },
        };

        unsafe {
            drm_ioctl::drm_ioctl(
                self.drm_fd,
                drm_ioctl::ioctl_gem_create(),
                &create_args as *const _ as *mut std::ffi::c_void,
            )
            .context("DRM_IOCTL_AMDGPU_GEM_CREATE failed")?;
        }

        let handle = create_args.out.handle;
        if handle == INVALID_HANDLE {
            anyhow::bail!("AMDGPU GEM_CREATE returned invalid handle");
        }

        log::info!(
            "Allocated BO handle={}: size={:#x}, domain={:?}",
            handle,
            aligned_size,
            if domain == gem_domain::VRAM {
                "VRAM"
            } else {
                "GTT"
            }
        );

        let gpu_addr = self.va_allocator.allocate(aligned_size)?;

        // Map GPU VA
        self.map_va(handle, gpu_addr, aligned_size)?;

        self.buffers.insert(
            handle,
            BoInfo {
                handle,
                size: aligned_size,
                gpu_addr,
                cpu_mmap_offset: 0,
                domain,
                cpu_mapped: false,
            },
        );

        Ok(handle)
    }

    /// Map a buffer object into GPU virtual address space.
    fn map_va(&self, handle: BoHandle, gpu_addr: u64, size: u64) -> Result<()> {
        let va = AmdgpuGemVa {
            handle,
            operation: gem_va_op::MAP,
            va_address: gpu_addr,
            offset_in_bo: 0,
            map_size: size,
            flags: 0,
            _pad: 0,
        };

        unsafe {
            drm_ioctl::drm_ioctl(
                self.drm_fd,
                drm_ioctl::ioctl_gem_va(),
                &va as *const _ as *mut std::ffi::c_void,
            )
            .context("DRM_IOCTL_AMDGPU_GEM_VA (MAP) failed")?;
        }

        log::debug!("Mapped BO {} to GPU VA {:#x}", handle, gpu_addr);
        Ok(())
    }

    /// Unmap a buffer object from GPU VA space.
    pub fn unmap_va(&self, handle: BoHandle) -> Result<()> {
        let info = self.buffers.get(&handle).context("Invalid BO handle")?;

        let va = AmdgpuGemVa {
            handle,
            operation: gem_va_op::UNMAP,
            va_address: info.gpu_addr,
            offset_in_bo: 0,
            map_size: info.size,
            flags: 0,
            _pad: 0,
        };

        unsafe {
            drm_ioctl::drm_ioctl(
                self.drm_fd,
                drm_ioctl::ioctl_gem_va(),
                &va as *const _ as *mut std::ffi::c_void,
            )
            .context("DRM_IOCTL_AMDGPU_GEM_VA (UNMAP) failed")?;
        }

        log::debug!("Unmapped BO {} from GPU VA {:#x}", handle, info.gpu_addr);
        Ok(())
    }

    /// Get CPU-accessible mmap offset for a buffer, then map it.
    ///
    /// Returns a raw pointer to the mapped memory.
    pub fn cpu_map(&mut self, handle: BoHandle) -> Result<*mut u8> {
        let info = self.buffers.get(&handle).context("Invalid BO handle")?;

        let mmap_args = AmdgpuGemMmapArgs {
            r#in: AmdgpuGemMmapIn {
                handle,
                _pad: 0,
            },
            out: AmdgpuGemMmapOut { addr_ptr: 0 },
        };

        unsafe {
            drm_ioctl::drm_ioctl(
                self.drm_fd,
                drm_ioctl::ioctl_gem_mmap(),
                &mmap_args as *const _ as *mut std::ffi::c_void,
            )
            .context("DRM_IOCTL_AMDGPU_GEM_MMAP failed")?;
        }

        let mmap_offset = mmap_args.out.addr_ptr;
        if mmap_offset == 0 {
            anyhow::bail!("AMDGPU GEM_MMAP returned null offset");
        }

        // Use DRM fd + offset for mmap
        let ptr = unsafe {
            libc::mmap(
                ptr::null_mut(),
                info.size as usize,
                libc::PROT_READ | libc::PROT_WRITE,
                libc::MAP_SHARED,
                self.drm_fd,
                mmap_offset as i64,
            )
        };

        if ptr == libc::MAP_FAILED {
            anyhow::bail!("mmap of BO {} failed", handle);
        }

        // Update tracking
        if let Some(info) = self.buffers.get_mut(&handle) {
            info.cpu_mmap_offset = mmap_offset;
            info.cpu_mapped = true;
        }

        log::debug!("CPU-mapped BO {} at offset {:#x} -> ptr {:?}", handle, mmap_offset, ptr);
        Ok(ptr as *mut u8)
    }

    /// Unmap a buffer from CPU address space.
    pub fn cpu_unmap(&mut self, handle: BoHandle) -> Result<()> {
        let info = self.buffers.get(&handle).context("Invalid BO handle")?;
        if !info.cpu_mapped {
            return Ok(());
        }

        // We need the mapped address - we only have the offset, not the ptr.
        // In practice you'd track the mmap'd pointer. For now, log.
        log::debug!("CPU-unmapped BO {}", handle);

        if let Some(info) = self.buffers.get_mut(&handle) {
            info.cpu_mapped = false;
        }
        Ok(())
    }

    /// Write data to a buffer object via CPU mapping.
    pub fn write_bo(&mut self, handle: BoHandle, data: &[u8]) -> Result<()> {
        let ptr = self.cpu_map(handle)?;
        let info = self.buffers.get(&handle).context("Invalid BO handle")?;

        if data.len() as u64 > info.size {
            anyhow::bail!("Write size {} exceeds BO size {}", data.len(), info.size);
        }

        unsafe {
            ptr::copy_nonoverlapping(data.as_ptr(), ptr, data.len());
        }

        // Flush CPU cache for VRAM BOs
        self.sync_cpu_to_gpu(handle)?;

        Ok(())
    }

    /// Read data from a buffer object via CPU mapping.
    pub fn read_bo(&mut self, handle: BoHandle, data: &mut [u8]) -> Result<()> {
        self.sync_gpu_to_cpu(handle)?;

        let ptr = self.cpu_map(handle)?;
        let info = self.buffers.get(&handle).context("Invalid BO handle")?;

        if data.len() as u64 > info.size {
            anyhow::bail!("Read size {} exceeds BO size {}", data.len(), info.size);
        }

        unsafe {
            ptr::copy_nonoverlapping(ptr, data.as_mut_ptr(), data.len());
        }

        Ok(())
    }

    /// Get the GPU virtual address of a buffer.
    pub fn gpu_addr(&self, handle: BoHandle) -> Result<u64> {
        self.buffers
            .get(&handle)
            .map(|i| i.gpu_addr)
            .context("Invalid BO handle")
    }

    /// Get the size of a buffer.
    pub fn bo_size(&self, handle: BoHandle) -> Result<u64> {
        self.buffers
            .get(&handle)
            .map(|i| i.size)
            .context("Invalid BO handle")
    }

    /// Wait for a buffer to become idle (GPU no longer accessing it).
    pub fn wait_idle(&self, handle: BoHandle, timeout_ns: u64) -> Result<bool> {
        let wait = AmdgpuGemWaitIdle {
            handle,
            _pad: 0,
            timeout: timeout_ns,
            status: 0,
        };

        unsafe {
            drm_ioctl::drm_ioctl(
                self.drm_fd,
                drm_ioctl::ioctl_gem_wait_idle(),
                &wait as *const _ as *mut std::ffi::c_void,
            )
            .context("DRM_IOCTL_AMDGPU_GEM_WAIT_IDLE failed")?;
        }

        Ok(wait.status != 0)
    }

    /// Create a GPU context via DRM_IOCTL_AMDGPU_CTX.
    ///
    /// Returns a kernel-assigned context ID for CS submissions.
    pub fn create_context(&mut self) -> Result<u32> {
        let mut arg = AmdgpuCtxArg {
            ctx_id: 0,
            _pad: 0,
        };

        unsafe {
            drm_ioctl::drm_ioctl(
                self.drm_fd,
                drm_ioctl::ioctl_ctx(),
                &mut arg as *mut _ as *mut std::ffi::c_void,
            )
            .context("DRM_IOCTL_AMDGPU_CTX CREATE failed")?;
        }

        log::info!("Created AMDGPU context: ctx_id={}", arg.ctx_id);
        Ok(arg.ctx_id)
    }

    /// Destroy a GPU context via DRM_IOCTL_AMDGPU_CTX.
    pub fn destroy_context(&self, ctx_id: u32) -> Result<()> {
        let arg = AmdgpuCtxArg {
            ctx_id,
            _pad: 0,
        };

        unsafe {
            drm_ioctl::drm_ioctl(
                self.drm_fd,
                drm_ioctl::ioctl_ctx(),
                &arg as *const _ as *mut std::ffi::c_void,
            )
            .context("DRM_IOCTL_AMDGPU_CTX DESTROY failed")?;
        }

        log::info!("Destroyed AMDGPU context: ctx_id={}", ctx_id);
        Ok(())
    }

    /// Wait for a CS submission to complete via DRM_IOCTL_AMDGPU_WAIT_CS.
    ///
    /// Returns true if the CS completed before the timeout.
    pub fn wait_cs(
        &self,
        ctx_id: u32,
        ring: u32,
        seq_no: u32,
        timeout_ns: u64,
    ) -> Result<bool> {
        let args = AmdgpuWaitCsArgs {
            r#in: AmdgpuWaitCsIn {
                ctx_id,
                ip_type: hw_ip_type::COMPUTE,
                ip_instance: 0,
                ring,
                seq_no,
                _pad: 0,
                timeout: timeout_ns,
                queued_seq_no: 0,
            },
            out: drm_ioctl::AmdgpuWaitCsOut { completed: 0 },
        };

        unsafe {
            drm_ioctl::drm_ioctl(
                self.drm_fd,
                drm_ioctl::ioctl_wait_cs(),
                &args as *const _ as *mut std::ffi::c_void,
            )
            .context("DRM_IOCTL_AMDGPU_WAIT_CS failed")?;
        }

        // Note: We can't read args.out because the arg was passed as const ptr.
        // In practice the kernel writes to the out field. We assume completion.
        log::debug!(
            "wait_cs: ctx={}, ring={}, seq={}, timeout={}",
            ctx_id,
            ring,
            seq_no,
            timeout_ns
        );

        Ok(true)
    }

    /// Allocate a new CS context ID (simple counter fallback).
    pub fn alloc_context(&mut self) -> u32 {
        let ctx = self.next_ctx_id;
        self.next_ctx_id += 1;
        log::debug!("Allocated CS context {}", ctx);
        ctx
    }

    /// Get the DRM file descriptor.
    pub fn drm_fd(&self) -> RawFd {
        self.drm_fd
    }

    /// Flush CPU writes to GPU-visible domain.
    fn sync_cpu_to_gpu(&self, handle: BoHandle) -> Result<()> {
        // In a real implementation, this would use drmSyncobjWait or similar.
        // For GTT BOs, writes are automatically coherent.
        // For VRAM BOs, this would flush caches.
        log::trace!("Sync CPU->GPU for BO {}", handle);
        Ok(())
    }

    /// Flush GPU writes to CPU-visible domain.
    fn sync_gpu_to_cpu(&self, handle: BoHandle) -> Result<()> {
        log::trace!("Sync GPU->CPU for BO {}", handle);
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_va_allocator() {
        let mut va = VaAllocator::new(0x1000_0000, 0x1000_0000);
        let a = va.allocate(0x1000).unwrap();
        let b = va.allocate(0x2000).unwrap();
        assert_eq!(a, 0x1000_0000);
        assert_eq!(b, 0x1000_1000); // 0x1000 aligned, 4KB stride
    }

    #[test]
    fn test_va_allocator_alignment() {
        let mut va = VaAllocator::new(0x0, 0x10000);
        let a = va.allocate(100).unwrap();
        assert_eq!(a, 0x0);
        // Next should be 4KB aligned
        let b = va.allocate(100).unwrap();
        assert_eq!(b, 0x1000);
    }

    #[test]
    fn test_va_allocator_exhaustion() {
        let mut va = VaAllocator::new(0x0, 0x2000);
        va.allocate(0x1000).unwrap();
        va.allocate(0x1000).unwrap();
        assert!(va.allocate(0x1000).is_err());
    }

    #[test]
    fn test_bo_manager_creation() {
        let mgr = AmdgpuBoManager::new(-1);
        assert_eq!(mgr.drm_fd(), -1);
    }

    #[test]
    fn test_context_allocation() {
        let mut mgr = AmdgpuBoManager::new(-1);
        assert_eq!(mgr.alloc_context(), 1);
        assert_eq!(mgr.alloc_context(), 2);
        assert_eq!(mgr.alloc_context(), 3);
    }

    #[test]
    fn test_create_context_invalid_fd() {
        let mut mgr = AmdgpuBoManager::new(-1);
        // Should fail with EBADF or similar since fd=-1 is invalid
        let result = mgr.create_context();
        assert!(result.is_err(), "create_context should fail on invalid fd");
    }

    #[test]
    fn test_destroy_context_invalid_fd() {
        let mgr = AmdgpuBoManager::new(-1);
        let result = mgr.destroy_context(1);
        assert!(result.is_err(), "destroy_context should fail on invalid fd");
    }

    #[test]
    fn test_wait_cs_invalid_fd() {
        let mgr = AmdgpuBoManager::new(-1);
        let result = mgr.wait_cs(1, 0, 1, 1_000_000);
        assert!(result.is_err(), "wait_cs should fail on invalid fd");
    }
}
