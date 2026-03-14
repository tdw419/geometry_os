// systems/infinite_map_rs/src/glass_ram/dma_sync.rs
//
// DMA Buffer Synchronization
// Implements CPU access synchronization via DMA_BUF_IOCTL_SYNC

use std::os::unix::io::RawFd;
use std::error::Error;
use std::fmt;
use nix::ioctl_write_ptr;

// -----------------------------------------------------------------------------
// Constants & Types (linux/dma-buf.h)
// -----------------------------------------------------------------------------

const DMA_BUF_BASE: u8 = b'b';
const DMA_BUF_SYNC_READ: u64 = 1 << 0;
const DMA_BUF_SYNC_WRITE: u64 = 1 << 1;
const DMA_BUF_SYNC_RW: u64 = DMA_BUF_SYNC_READ | DMA_BUF_SYNC_WRITE;
const DMA_BUF_SYNC_START: u64 = 0 << 2;
const DMA_BUF_SYNC_END: u64 = 1 << 2;

#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct DmaBufSync {
    pub flags: u64,
}

// Define the ioctl
// _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
ioctl_write_ptr!(dma_buf_ioctl_sync, DMA_BUF_BASE, 0, DmaBufSync);

// -----------------------------------------------------------------------------
// Error Handling
// -----------------------------------------------------------------------------

#[derive(Debug)]
pub enum DmaSyncError {
    SyncFailed(nix::Error),
    InvalidFd,
}

impl fmt::Display for DmaSyncError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            DmaSyncError::SyncFailed(e) => write!(f, "DMA sync ioctl failed: {}", e),
            DmaSyncError::InvalidFd => write!(f, "Invalid file descriptor"),
        }
    }
}

impl Error for DmaSyncError {}

pub type Result<T> = std::result::Result<T, Box<dyn Error>>;

// -----------------------------------------------------------------------------
// DmaFence (Wrapper for Sync Operations)
// -----------------------------------------------------------------------------

pub struct DmaFence {
    fd: RawFd,
}

impl DmaFence {
    pub fn new(fd: RawFd) -> Self {
        Self { fd }
    }

    /// Begin CPU access to the buffer.
    /// Must be called before reading/writing the mapped memory.
    pub fn start_cpu_access(&self, read: bool, write: bool) -> Result<()> {
        let mut flags = DMA_BUF_SYNC_START;
        if read { flags |= DMA_BUF_SYNC_READ; }
        if write { flags |= DMA_BUF_SYNC_WRITE; }

        let sync_args = DmaBufSync { flags };
        
        unsafe {
            dma_buf_ioctl_sync(self.fd, &sync_args)
                .map_err(|e| Box::new(DmaSyncError::SyncFailed(e)) as Box<dyn Error>)?;
        }
        
        Ok(())
    }

    /// End CPU access to the buffer.
    /// Must be called after finishing CPU operations.
    pub fn end_cpu_access(&self, read: bool, write: bool) -> Result<()> {
        let mut flags = DMA_BUF_SYNC_END;
        if read { flags |= DMA_BUF_SYNC_READ; }
        if write { flags |= DMA_BUF_SYNC_WRITE; }

        let sync_args = DmaBufSync { flags };
        
        unsafe {
            dma_buf_ioctl_sync(self.fd, &sync_args)
                .map_err(|e| Box::new(DmaSyncError::SyncFailed(e)) as Box<dyn Error>)?;
        }
        
        Ok(())
    }

    /// Wait for the fence (compatibility wrapper)
    pub fn wait(&self, _timeout_ms: u32) -> Result<()> {
        // Equivalent to starting CPU access (waits for GPU)
        self.start_cpu_access(true, true)
    }
    
    // Legacy/Stub methods to match previous interface if needed mostly unused now
    // or we can adapt the caller.
}
