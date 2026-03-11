use shared_memory::{Shmem, ShmemConf, ShmemError};
use serde::{Serialize, Deserialize};
use std::sync::atomic::{AtomicU64, Ordering};
use log::{info, error};

/// The name of the Shared Memory region used for the bridge.
const SHM_ID: &str = "geometry_os_unreal_bridge_01";
/// Size of the shared memory: 64MB (should be plenty for terrain chunks).
const SHM_SIZE: usize = 64 * 1024 * 1024;

/// The header layout in shared memory.
/// This must match the C++ side exactly.
#[repr(C)]
struct BridgeHeader {
    write_cursor: AtomicU64, // Where Rust writes
    read_cursor: AtomicU64,  // Where Unreal reads
    buffer_size: u64,        // Total size of the data buffer
}

/// The packet sent over the bridge.
#[derive(Serialize, Deserialize, Debug, Clone)]
#[repr(C)]
pub struct TectonicUpdatePacket {
    pub timestamp: u64,
    pub chunk_id: u64,
    pub lod_level: u8,
    pub data_size: u32,
    // The actual payload follows this header in the stream, but for the struct definition
    // we keep it separate or manage it via serialization.
    // For specific integration, we serialize the whole struct + payload bytes.
}

pub struct UnrealBridge {
    shmem: Shmem,
    is_connected: bool,
}

impl UnrealBridge {
    pub fn new() -> Option<Self> {
        info!("Initializing Unreal Engine Bridge...");
        
        // Attempt to clean up stale shm if it exists (Linux specific hack, or just ignore)
        
        let shmem = match ShmemConf::new().os_id(SHM_ID).open() {
            Ok(m) => {
                info!("Opened existing shared memory region: {}", SHM_ID);
                m
            },
            Err(_) => {
                match ShmemConf::new().size(SHM_SIZE).os_id(SHM_ID).create() {
                    Ok(m) => {
                        info!("Created new shared memory region: {}", SHM_ID);
                        m
                    },
                    Err(e) => {
                        error!("Failed to initialize SHM: {}", e);
                        return None;
                    }
                }
            }
        };
        
        let bridge = UnrealBridge {
            shmem,
            is_connected: true,
        };
        
        bridge.init_header();
        Some(bridge)
    }

    fn init_header(&self) {
        unsafe {
            let ptr = self.shmem.as_ptr();
            let _header = &mut *(ptr as *mut BridgeHeader);
            // Only reset if we created it? Or always reset on OS boot?
            // For now, let's just log. Unreal should handle resets.
            // header.write_cursor.store(0, Ordering::SeqCst);
            // header.read_cursor.store(0, Ordering::SeqCst);
        }
    }

    /// broadcast a terrain update to the ether.
    pub fn broadcast_update(&mut self, chunk_id: u64, lod: u8, payload: &[u8]) {
        if !self.is_connected { return; }

        let packet = TectonicUpdatePacket {
            timestamp: chrono::Utc::now().timestamp_millis() as u64,
            chunk_id,
            lod_level: lod,
            data_size: payload.len() as u32,
        };

        // TODO: Implement the Ring Buffer write logic.
        // For this first pass, we simply serialize to a fixed offset to verify visibility.
        // We will write to offset 1024 (leaving room for header).

        let _header_size = std::mem::size_of::<BridgeHeader>();
        let offset = 4096; // Safe alignment start
        
        unsafe {
            let ptr = self.shmem.as_ptr();
            let data_ptr = ptr.add(offset);
            
            // Serialize packet header
            let encoded_packet = bincode::serialize(&packet).unwrap_or_default();
            std::ptr::copy_nonoverlapping(encoded_packet.as_ptr(), data_ptr, encoded_packet.len());
            
            // Serialize payload immediately after
            let payload_ptr = data_ptr.add(encoded_packet.len());
            
            // Boundary check
            if offset + encoded_packet.len() + payload.len() > SHM_SIZE {
                error!("Packet too large for SHM buffer!");
                return;
            }
            
            std::ptr::copy_nonoverlapping(payload.as_ptr(), payload_ptr, payload.len());
            
            // Update Write Cursor (Mock logic for now - simply toggling to signal update)
            let header = &mut *(ptr as *mut BridgeHeader);
            header.write_cursor.fetch_add(1, Ordering::SeqCst);
        }
    }
}
