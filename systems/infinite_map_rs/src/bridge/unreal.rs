use log::{error, info};
use serde::{Deserialize, Serialize};
use shared_memory::{Shmem, ShmemConf};
use std::sync::atomic::{AtomicU64, Ordering};

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
            Err(_) => match ShmemConf::new().size(SHM_SIZE).os_id(SHM_ID).create() {
                Ok(m) => {
                    info!("Created new shared memory region: {}", SHM_ID);
                    m
                },
                Err(e) => {
                    error!("Failed to initialize SHM: {}", e);
                    return None;
                },
            },
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
        if !self.is_connected {
            return;
        }

        let packet = TectonicUpdatePacket {
            timestamp: chrono::Utc::now().timestamp_millis() as u64,
            chunk_id,
            lod_level: lod,
            data_size: payload.len() as u32,
        };

        // Serialize packet header first
        let encoded_packet =
            bincode::serde::encode_to_vec(&packet, bincode::config::standard())
                .unwrap_or_default();

        // Total write size: packet header + payload
        let total_size = encoded_packet.len() + payload.len();
        let header_size = std::mem::size_of::<BridgeHeader>();
        let buffer_size = SHM_SIZE - header_size;

        unsafe {
            let ptr = self.shmem.as_ptr();
            let header = &*(ptr as *const BridgeHeader);

            // Read current positions atomically
            let write_cursor = header.write_cursor.load(Ordering::Acquire);
            let read_cursor = header.read_cursor.load(Ordering::Acquire);

            // Calculate available space
            let available = if write_cursor >= read_cursor {
                // Normal case: write ahead of read
                // Available = buffer_size - (write - read)
                buffer_size - (write_cursor - read_cursor) as usize
            } else {
                // Wrapped case: write behind read
                // Available = read - write
                (read_cursor - write_cursor) as usize
            };

            // Check if we have enough space
            if total_size > available {
                error!("Ring buffer full! Need {} bytes, have {}", total_size, available);
                return;
            }

            // Calculate write offset (wrapping)
            let write_offset = (write_cursor % buffer_size as u64) as usize;
            let data_start = header_size + write_offset;

            // Check for wrap-around
            if write_offset + total_size > buffer_size {
                // Need to wrap around - write in two parts
                let first_part = buffer_size - write_offset;

                // Write first part (to end of buffer)
                let data_ptr = ptr.add(data_start);
                let first_packet_len = encoded_packet.len().min(first_part);
                std::ptr::copy_nonoverlapping(
                    encoded_packet.as_ptr(),
                    data_ptr,
                    first_packet_len,
                );

                // If packet header wraps, write remainder at start
                if first_packet_len < encoded_packet.len() {
                    let remaining_packet = encoded_packet.len() - first_packet_len;
                    let wrap_ptr = ptr.add(header_size);
                    std::ptr::copy_nonoverlapping(
                        encoded_packet.as_ptr().add(first_packet_len),
                        wrap_ptr,
                        remaining_packet,
                    );

                    // Payload starts after remaining packet bytes
                    let payload_offset = remaining_packet;
                    let payload_ptr = wrap_ptr.add(payload_offset);
                    std::ptr::copy_nonoverlapping(payload.as_ptr(), payload_ptr, payload.len());
                } else {
                    // Packet header fits, write payload (may wrap)
                    let payload_ptr = data_ptr.add(first_packet_len);
                    let payload_first = payload.len().min(first_part - first_packet_len);
                    std::ptr::copy_nonoverlapping(payload.as_ptr(), payload_ptr, payload_first);

                    if payload_first < payload.len() {
                        // Wrap remaining payload
                        let wrap_ptr = ptr.add(header_size);
                        std::ptr::copy_nonoverlapping(
                            payload.as_ptr().add(payload_first),
                            wrap_ptr,
                            payload.len() - payload_first,
                        );
                    }
                }
            } else {
                // Simple case: write fits without wrap
                let data_ptr = ptr.add(data_start);
                std::ptr::copy_nonoverlapping(encoded_packet.as_ptr(), data_ptr, encoded_packet.len());

                let payload_ptr = data_ptr.add(encoded_packet.len());
                std::ptr::copy_nonoverlapping(payload.as_ptr(), payload_ptr, payload.len());
            }

            // Update write cursor atomically
            header.write_cursor.fetch_add(total_size as u64, Ordering::Release);
        }
    }
}
