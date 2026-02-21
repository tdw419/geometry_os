// systems/infinite_map_rs/src/qemu/memory_bridge.rs
//
// QEMU Shared Memory Bridge
// Phase 36.1: Zero-copy access to guest RAM via /dev/shm

use std::fs::File;
use std::io;
use std::path::Path;
use memmap2::Mmap;

use thiserror::Error;

#[derive(Error, Debug)]
pub enum BridgeError {
    #[error("Shared memory file not found: {0}")]
    FileNotFound(String),
    #[error("Permission denied to access shared memory")]
    PermissionDenied,
    #[error("Failed to map memory: {0}")]
    MmapFailed(#[from] io::Error),
    #[error("Invalid address access: {addr} (len: {len}, max: {max})")]
    InvalidAddress { addr: u64, len: usize, max: usize },
}

pub struct SharedMemoryBridge {
    mmap: Mmap,
    vm_id: String,
    size: usize,
}

impl SharedMemoryBridge {
    /// Create a new bridge to a QEMU VM's shared memory file
    pub fn new(vm_id: &str) -> Result<Self, BridgeError> {
        let path = format!("/dev/shm/qemu_ram_{}", vm_id);
        let path_ref = Path::new(&path);

        if !path_ref.exists() {
            return Err(BridgeError::FileNotFound(path));
        }

        let file = File::open(path_ref).map_err(|e| {
            match e.kind() {
                io::ErrorKind::PermissionDenied => BridgeError::PermissionDenied,
                _ => BridgeError::MmapFailed(e),
            }
        })?;

        let mmap = unsafe { Mmap::map(&file).map_err(BridgeError::MmapFailed)? };
        let size = mmap.len();

        Ok(Self {
            mmap,
            vm_id: vm_id.to_string(),
            size,
        })
    }

    /// Read guest physical memory at the specified address
    /// Returns a slice directly into the memory-mapped RAM
    pub fn read_physical(&self, addr: u64, len: usize) -> Result<&[u8], BridgeError> {
        let end = addr as usize + len;
        if end > self.size {
            return Err(BridgeError::InvalidAddress {
                addr,
                len,
                max: self.size,
            });
        }

        Ok(&self.mmap[addr as usize..end])
    }

    /// Take a full snapshot of guest RAM (copying it to a Vec)
    pub fn snapshot(&self) -> Vec<u8> {
        self.mmap.to_vec()
    }

    /// Get total size of mapped guest RAM
    pub fn size(&self) -> usize {
        self.size
    }

    /// Get the VM Identifier
    pub fn vm_id(&self) -> &str {
        &self.vm_id
    }

    /// Get a slice reference to the entire shared memory
    pub fn as_slice(&self) -> &[u8] {
        &self.mmap[..]
    }

    /// Inverse Hilbert mapping: (x,y) -> Linear address
    /// Used for mouse interaction to find which memory byte is at a pixel
    pub fn xy2h(&self, x: u32, y: u32, width: u32) -> Option<usize> {
        // Use fast_hilbert to convert (x,y) back to linear address
        let addr = fast_hilbert::xy2h(x, y);
        if addr < self.size as u64 {
            Some(addr as usize)
        } else {
            None
        }
    }

    /// Read a 4KB page surrounding the given address
    /// Useful for providing context to the Synaptic Analyst
    pub fn read_page(&self, addr: u64) -> Result<&[u8], BridgeError> {
        let page_start = addr & !0xFFF; // Align to 4KB boundary
        self.read_physical(page_start, 4096)
    }

    /// Discover active QEMU VMs by scanning /dev/shm
    pub fn discover_active_vms() -> Vec<String> {
        let mut vms = Vec::new();
        if let Ok(entries) = std::fs::read_dir("/dev/shm") {
            for entry in entries.flatten() {
                if let Ok(name) = entry.file_name().into_string() {
                    if name.starts_with("qemu_ram_") {
                        let id = name.trim_start_matches("qemu_ram_").to_string();
                        vms.push(id);
                    }
                }
            }
        }
        vms
    }
}
