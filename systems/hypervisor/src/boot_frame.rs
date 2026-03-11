//! Boot Frame Protocol for Network Boot
//!
//! Binary format: [seq:4][len:4][offset:8][data:N][checksum:64]
//! - seq: 4 bytes, uint32, frame sequence number (big-endian)
//! - len: 4 bytes, uint32, data length (big-endian)
//! - offset: 8 bytes, uint64, byte offset in total image (big-endian)
//! - data: N bytes, raw texture chunk
//! - checksum: 64 bytes, ASCII hex of SHA256(data)
//!
//! End-of-stream marker: sequence = 0xFFFFFFFF
//!
//! Task 3: Create Rust Net Loader
//! Phase 8: Network Boot

use sha2::{Sha256, Digest};
use thiserror::Error;

/// Wire format constants
pub const WIRE_PREFIX_SIZE: usize = 16;  // 4 + 4 + 8 bytes
pub const CHECKSUM_SIZE: usize = 64;      // 64 hex chars
pub const END_OF_STREAM_MARKER: u32 = 0xFFFFFFFF;

/// Errors for BootFrame operations
#[derive(Error, Debug)]
pub enum BootFrameError {
    #[error("Frame too short: {0} bytes")]
    FrameTooShort(usize),

    #[error("Frame incomplete: expected {expected} bytes, got {actual}")]
    FrameIncomplete { expected: usize, actual: usize },

    #[error("Checksum mismatch: expected {expected}, computed {computed}")]
    ChecksumMismatch { expected: String, computed: String },

    #[error("Invalid checksum encoding: {0}")]
    InvalidChecksumEncoding(String),
}

/// A single frame in the boot texture stream.
///
/// Wire format matches Python BootFrame exactly:
/// [seq:4][len:4][offset:8][data:N][checksum:64]
#[derive(Debug, Clone)]
pub struct BootFrame {
    /// Frame number (uint32)
    pub sequence: u32,
    /// Byte offset in total image (uint64)
    pub chunk_offset: u64,
    /// Raw texture bytes
    pub chunk_data: Vec<u8>,
    /// SHA256 of chunk_data (64 hex chars)
    pub checksum: String,
}

impl BootFrame {
    /// Create a new BootFrame with computed checksum
    pub fn new(sequence: u32, chunk_offset: u64, chunk_data: Vec<u8>) -> Self {
        let checksum = Self::compute_checksum(&chunk_data);
        Self {
            sequence,
            chunk_offset,
            chunk_data,
            checksum,
        }
    }

    /// Compute SHA256 checksum of data as hex string
    fn compute_checksum(data: &[u8]) -> String {
        let mut hasher = Sha256::new();
        hasher.update(data);
        let result = hasher.finalize();
        hex::encode(result)
    }

    /// Verify the checksum matches the chunk data.
    pub fn validate_checksum(&self) -> bool {
        let computed = Self::compute_checksum(&self.chunk_data);
        computed == self.checksum
    }

    /// Validate checksum and return error on mismatch
    pub fn validate_checksum_strict(&self) -> Result<(), BootFrameError> {
        let computed = Self::compute_checksum(&self.chunk_data);
        if computed == self.checksum {
            Ok(())
        } else {
            Err(BootFrameError::ChecksumMismatch {
                expected: self.checksum.clone(),
                computed,
            })
        }
    }

    /// Serialize frame to wire format.
    ///
    /// Format: [seq:4][len:4][offset:8][data:N][checksum:64]
    pub fn to_bytes(&self) -> Vec<u8> {
        let data_len = self.chunk_data.len() as u32;
        let mut buffer = Vec::with_capacity(
            WIRE_PREFIX_SIZE + self.chunk_data.len() + CHECKSUM_SIZE
        );

        // Pack header: big-endian
        buffer.extend_from_slice(&self.sequence.to_be_bytes());
        buffer.extend_from_slice(&data_len.to_be_bytes());
        buffer.extend_from_slice(&self.chunk_offset.to_be_bytes());

        // Pack data
        buffer.extend_from_slice(&self.chunk_data);

        // Pack checksum as ASCII
        buffer.extend_from_slice(self.checksum.as_bytes());

        buffer
    }

    /// Deserialize frame from wire format.
    ///
    /// Format: [seq:4][len:4][offset:8][data:N][checksum:64]
    pub fn from_bytes(data: &[u8]) -> Result<Self, BootFrameError> {
        // Minimum size check
        if data.len() < WIRE_PREFIX_SIZE + CHECKSUM_SIZE {
            return Err(BootFrameError::FrameTooShort(data.len()));
        }

        // Unpack header (big-endian)
        let sequence = u32::from_be_bytes([data[0], data[1], data[2], data[3]]);
        let data_len = u32::from_be_bytes([data[4], data[5], data[6], data[7]]) as usize;
        let chunk_offset = u64::from_be_bytes([
            data[8], data[9], data[10], data[11],
            data[12], data[13], data[14], data[15],
        ]);

        // Calculate boundaries
        let chunk_start = WIRE_PREFIX_SIZE;
        let chunk_end = chunk_start + data_len;
        let checksum_start = chunk_end;
        let checksum_end = checksum_start + CHECKSUM_SIZE;

        // Validate size
        if data.len() < checksum_end {
            return Err(BootFrameError::FrameIncomplete {
                expected: checksum_end,
                actual: data.len(),
            });
        }

        // Extract chunk data
        let chunk_data = data[chunk_start..chunk_end].to_vec();

        // Extract checksum
        let checksum_bytes = &data[checksum_start..checksum_end];
        let checksum = std::str::from_utf8(checksum_bytes)
            .map_err(|_| BootFrameError::InvalidChecksumEncoding(
                "Non-ASCII characters in checksum".to_string()
            ))?
            .to_string();

        Ok(Self {
            sequence,
            chunk_offset,
            chunk_data,
            checksum,
        })
    }

    /// Check if this is an end-of-stream marker
    pub fn is_end_of_stream(&self) -> bool {
        self.sequence == END_OF_STREAM_MARKER
    }

    /// Create an end-of-stream marker frame
    pub fn end_of_stream(total_offset: u64) -> Self {
        Self::new(END_OF_STREAM_MARKER, total_offset, Vec::new())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_checksum_validation() {
        let frame = BootFrame::new(0, 0, vec![1, 2, 3, 4]);
        assert!(frame.validate_checksum());
    }

    #[test]
    fn test_serialize_deserialize() {
        let original = BootFrame::new(42, 1024, vec![0xDE, 0xAD, 0xBE, 0xEF]);
        let bytes = original.to_bytes();
        let parsed = BootFrame::from_bytes(&bytes).unwrap();

        assert_eq!(original.sequence, parsed.sequence);
        assert_eq!(original.chunk_offset, parsed.chunk_offset);
        assert_eq!(original.chunk_data, parsed.chunk_data);
        assert_eq!(original.checksum, parsed.checksum);
    }

    #[test]
    fn test_empty_chunk() {
        let frame = BootFrame::new(0, 0, Vec::new());
        assert!(frame.validate_checksum());

        // SHA256 of empty string
        assert_eq!(
            frame.checksum,
            "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        );
    }

    #[test]
    fn test_end_of_stream() {
        let eos = BootFrame::end_of_stream(1000);
        assert!(eos.is_end_of_stream());
        assert_eq!(eos.sequence, END_OF_STREAM_MARKER);
    }

    #[test]
    fn test_frame_too_short() {
        let short_data = vec![0, 0, 0, 1]; // Only 4 bytes
        let result = BootFrame::from_bytes(&short_data);
        assert!(matches!(result, Err(BootFrameError::FrameTooShort(_))));
    }
}
