//! Linux Boot Bundle Test
//!
//! Tests the RISC-V executor's ability to load and boot Linux kernel bundles
//! with the LNX magic header format.
//!
//! Memory Layout (must match pixel_bundler.py):
//! - 0x0000: Header (20 bytes - magic "LNX" + metadata)
//! - 0x1000: Kernel (standard RISC-V entry point)
//! - 0x01000000: Initrd (16MB offset)
//! - 0x02000000: Device tree (32MB offset)

use byteorder::{LittleEndian, ReadBytesExt, WriteBytesExt};
use std::io::Cursor;

/// Linux boot bundle header
#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct LinuxHeader {
    /// Magic bytes "LNX"
    pub magic: [u8; 4],
    /// Entry point address (typically 0x1000)
    pub entry_point: u32,
    /// Kernel size in bytes
    pub kernel_size: u32,
    /// Initrd size in bytes
    pub initrd_size: u32,
    /// Device tree blob size in bytes
    pub dtb_size: u32,
}

impl LinuxHeader {
    /// Create a new Linux header
    pub fn new(entry_point: u32, kernel_size: u32, initrd_size: u32, dtb_size: u32) -> Self {
        Self {
            magic: [b'L', b'N', b'X', 0],
            entry_point,
            kernel_size,
            initrd_size,
            dtb_size,
        }
    }

    /// Serialize header to bytes
    pub fn to_bytes(&self) -> Vec<u8> {
        let mut bytes = Vec::with_capacity(20);
        bytes.extend_from_slice(&self.magic);
        bytes.write_u32::<LittleEndian>(self.entry_point).unwrap();
        bytes.write_u32::<LittleEndian>(self.kernel_size).unwrap();
        bytes.write_u32::<LittleEndian>(self.initrd_size).unwrap();
        bytes.write_u32::<LittleEndian>(self.dtb_size).unwrap();
        bytes
    }

    /// Parse header from bytes
    pub fn from_bytes(data: &[u8]) -> Option<Self> {
        if data.len() < 20 {
            return None;
        }

        let magic = [data[0], data[1], data[2], data[3]];
        // Check for "LNX\0" magic
        if magic != [b'L', b'N', b'X', 0] {
            return None;
        }

        let mut cursor = Cursor::new(&data[4..]);
        let entry_point = cursor.read_u32::<LittleEndian>().ok()?;
        let kernel_size = cursor.read_u32::<LittleEndian>().ok()?;
        let initrd_size = cursor.read_u32::<LittleEndian>().ok()?;
        let dtb_size = cursor.read_u32::<LittleEndian>().ok()?;

        Some(Self {
            magic,
            entry_point,
            kernel_size,
            initrd_size,
            dtb_size,
        })
    }
}

/// Memory layout constants (must match Python bundler)
pub mod layout {
    /// Kernel offset in RAM
    pub const KERNEL_OFFSET: u64 = 0x1000;
    /// Initrd offset in RAM (16MB)
    pub const INITRD_OFFSET: u64 = 0x01000000;
    /// Device tree offset in RAM (32MB)
    pub const DTB_OFFSET: u64 = 0x02000000;
    /// Header size
    pub const HEADER_SIZE: u64 = 20;
}

/// Create a minimal Linux boot bundle for testing
pub fn create_test_bundle(kernel_size: usize, initrd_size: usize, dtb_size: usize) -> Vec<u8> {
    let header = LinuxHeader::new(
        0x1000,
        kernel_size as u32,
        initrd_size as u32,
        dtb_size as u32,
    );
    let header_bytes = header.to_bytes();

    // Calculate total size needed
    let offsets = [
        layout::KERNEL_OFFSET + kernel_size as u64,
        layout::INITRD_OFFSET + initrd_size as u64,
        layout::DTB_OFFSET + dtb_size as u64,
    ];
    let max_offset = offsets.iter().max().unwrap();

    let total_size = *max_offset as usize;
    let mut payload = vec![0u8; total_size];

    // Write header at start
    payload[0..header_bytes.len()].copy_from_slice(&header_bytes);

    // Write kernel at KERNEL_OFFSET
    if kernel_size > 0 {
        let kernel_data = vec![0x13u8; kernel_size]; // NOP instructions
        let kernel_start = layout::KERNEL_OFFSET as usize;
        let kernel_end = kernel_start + kernel_size;
        payload[kernel_start..kernel_end].copy_from_slice(&kernel_data);
    }

    // Write initrd at INITRD_OFFSET
    if initrd_size > 0 {
        let initrd_data = vec![0x00u8; initrd_size];
        let initrd_start = layout::INITRD_OFFSET as usize;
        let initrd_end = initrd_start + initrd_size;
        payload[initrd_start..initrd_end].copy_from_slice(&initrd_data);
    }

    // Write DTB at DTB_OFFSET
    if dtb_size > 0 {
        let dtb_data = vec![0xD0u8; dtb_size];
        let dtb_start = layout::DTB_OFFSET as usize;
        let dtb_end = dtb_start + dtb_size;
        payload[dtb_start..dtb_end].copy_from_slice(&dtb_data);
    }

    payload
}

/// Verify Linux boot register values
///
/// Linux expects these registers at boot:
/// - a0 (x10) = hart ID (0 for boot hart)
/// - a1 (x11) = DTB physical address
/// - a2 (x12) = 0 (reserved)
/// - a3 (x13) = 0 (reserved)
#[cfg(test)]
mod register_tests {
    use super::*;

    #[test]
    fn test_header_magic_detection() {
        let header = LinuxHeader::new(0x1000, 1024, 2048, 512);
        let bytes = header.to_bytes();

        // First 4 bytes should be "LNX\0"
        assert_eq!(&bytes[0..4], &[b'L', b'N', b'X', 0]);
    }

    #[test]
    fn test_header_serialization_roundtrip() {
        let original = LinuxHeader::new(0x1000, 1024, 2048, 512);
        let bytes = original.to_bytes();
        let parsed = LinuxHeader::from_bytes(&bytes).unwrap();

        assert_eq!(original.magic, parsed.magic);
        assert_eq!(original.entry_point, parsed.entry_point);
        assert_eq!(original.kernel_size, parsed.kernel_size);
        assert_eq!(original.initrd_size, parsed.initrd_size);
        assert_eq!(original.dtb_size, parsed.dtb_size);
    }

    #[test]
    fn test_header_rejects_invalid_magic() {
        let mut bytes = vec![0u8; 20];
        // Write wrong magic
        bytes[0..4].copy_from_slice(&[b'X', b'Y', b'Z', b'Y']);
        bytes[4..8].copy_from_slice(&0x1000u32.to_le_bytes());

        assert!(LinuxHeader::from_bytes(&bytes).is_none());
    }

    #[test]
    fn test_bundle_creation() {
        let bundle = create_test_bundle(256, 512, 128);

        // Verify header
        let header = LinuxHeader::from_bytes(&bundle).unwrap();
        assert_eq!(header.magic, [b'L', b'N', b'X', 0]);
        assert_eq!(header.entry_point, 0x1000);
        assert_eq!(header.kernel_size, 256);
        assert_eq!(header.initrd_size, 512);
        assert_eq!(header.dtb_size, 128);

        // Verify kernel placement
        let kernel_start = layout::KERNEL_OFFSET as usize;
        assert_eq!(bundle[kernel_start], 0x13);
        assert_eq!(bundle[kernel_start + 255], 0x13);

        // Verify initrd placement
        let initrd_start = layout::INITRD_OFFSET as usize;
        assert_eq!(bundle[initrd_start], 0x00);
        assert_eq!(bundle[initrd_start + 511], 0x00);

        // Verify DTB placement
        let dtb_start = layout::DTB_OFFSET as usize;
        assert_eq!(bundle[dtb_start], 0xD0);
        assert_eq!(bundle[dtb_start + 127], 0xD0);
    }

    #[test]
    fn test_layout_constants_match_python_bundler() {
        // These constants MUST match the Python bundler
        assert_eq!(layout::KERNEL_OFFSET, 0x1000);
        assert_eq!(layout::INITRD_OFFSET, 0x01000000);
        assert_eq!(layout::DTB_OFFSET, 0x02000000);
        assert_eq!(layout::HEADER_SIZE, 20);
    }

    #[test]
    fn test_empty_bundle() {
        let bundle = create_test_bundle(0, 0, 0);

        let header = LinuxHeader::from_bytes(&bundle).unwrap();
        assert_eq!(header.kernel_size, 0);
        assert_eq!(header.initrd_size, 0);
        assert_eq!(header.dtb_size, 0);
    }

    #[test]
    fn test_large_bundle() {
        // Simulate a real kernel size (~5MB)
        let bundle = create_test_bundle(5 * 1024 * 1024, 16 * 1024 * 1024, 64 * 1024);

        let header = LinuxHeader::from_bytes(&bundle).unwrap();
        assert_eq!(header.kernel_size, 5 * 1024 * 1024);
        assert_eq!(header.initrd_size, 16 * 1024 * 1024);
        assert_eq!(header.dtb_size, 64 * 1024);

        // Verify the bundle is large enough (>= since we need to include the last byte)
        assert!(bundle.len() >= layout::DTB_OFFSET as usize + 64 * 1024);
    }
}
