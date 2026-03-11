//! Network Boot Loader
//!
//! Connects to boot_bridge WebSocket and reconstructs memory from boot frames.
//!
//! Task 3: Create Rust Net Loader
//! Phase 8: Network Boot

use std::collections::HashMap;
use std::error::Error;
use futures_util::StreamExt;
use tokio_tungstenite::{connect_async, tungstenite::Message};

use crate::boot_frame::{BootFrame, BootFrameError, END_OF_STREAM_MARKER};

/// Errors for NetLoader operations
#[derive(Debug)]
pub enum NetLoaderError {
    WebSocketError(String),
    FrameError(BootFrameError),
    ConnectionError(String),
    IntegrityError(String),
}

impl std::fmt::Display for NetLoaderError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            NetLoaderError::WebSocketError(s) => write!(f, "WebSocket error: {}", s),
            NetLoaderError::FrameError(e) => write!(f, "Frame error: {}", e),
            NetLoaderError::ConnectionError(s) => write!(f, "Connection error: {}", s),
            NetLoaderError::IntegrityError(s) => write!(f, "Integrity error: {}", s),
        }
    }
}

impl std::error::Error for NetLoaderError {}

impl From<BootFrameError> for NetLoaderError {
    fn from(e: BootFrameError) -> Self {
        NetLoaderError::FrameError(e)
    }
}

/// Network Boot Loader
///
/// Connects to boot_bridge WebSocket and reconstructs memory from boot frames
/// with SHA256 integrity validation.
pub struct NetLoader {
    /// WebSocket server URL (e.g., "ws://localhost:8765")
    server_url: String,
    /// Reconstructed memory chunks indexed by offset
    memory: HashMap<u64, Vec<u8>>,
    /// Number of frames received
    frames_received: u32,
    /// Total bytes received
    bytes_received: u64,
    /// Connection state
    connected: bool,
}

impl NetLoader {
    /// Create a new NetLoader targeting the given server URL
    pub fn new(server_url: &str) -> Self {
        Self {
            server_url: server_url.to_string(),
            memory: HashMap::new(),
            frames_received: 0,
            bytes_received: 0,
            connected: false,
        }
    }

    /// Connect to the boot bridge WebSocket server
    pub async fn connect(&mut self) -> Result<(), Box<dyn Error>> {
        let _url = url::Url::parse(&self.server_url)
            .map_err(|e| NetLoaderError::ConnectionError(e.to_string()))?;

        let (_ws_stream, _) = connect_async(&self.server_url)
            .await
            .map_err(|e| NetLoaderError::ConnectionError(e.to_string()))?;

        self.connected = true;
        Ok(())
    }

    /// Receive all frames and reconstruct memory
    ///
    /// This is a convenience method that handles the full boot sequence.
    pub async fn load(&mut self) -> Result<(), NetLoaderError> {
        let _url = url::Url::parse(&self.server_url)
            .map_err(|e| NetLoaderError::ConnectionError(e.to_string()))?;

        let (ws_stream, _) = connect_async(&self.server_url)
            .await
            .map_err(|e| NetLoaderError::WebSocketError(e.to_string()))?;

        let (_, mut read) = ws_stream.split();

        self.connected = true;

        while let Some(msg) = read.next().await {
            let msg = msg.map_err(|e| NetLoaderError::WebSocketError(e.to_string()))?;

            if let Message::Binary(data) = msg {
                let frame = BootFrame::from_bytes(&data)?;

                // Check for end of stream
                if frame.sequence == END_OF_STREAM_MARKER {
                    break;
                }

                // Validate checksum
                if !frame.validate_checksum() {
                    return Err(NetLoaderError::IntegrityError(format!(
                        "Checksum mismatch at frame {}",
                        frame.sequence
                    )));
                }

                // Store chunk
                let offset = frame.chunk_offset;
                let len = frame.chunk_data.len() as u64;
                self.bytes_received += len;
                self.frames_received += 1;
                self.memory.insert(offset, frame.chunk_data);
            }
        }

        Ok(())
    }

    /// Get reconstructed memory as contiguous bytes
    pub fn get_memory(&self) -> Vec<u8> {
        if self.memory.is_empty() {
            return Vec::new();
        }

        // Sort offsets and concatenate
        let mut offsets: Vec<&u64> = self.memory.keys().collect();
        offsets.sort();

        let mut result = Vec::new();
        for offset in offsets {
            if let Some(chunk) = self.memory.get(offset) {
                result.extend_from_slice(chunk);
            }
        }

        result
    }

    /// Get loader statistics
    ///
    /// Returns (frames_received, bytes_received)
    pub fn stats(&self) -> (u32, u64) {
        (self.frames_received, self.bytes_received)
    }

    /// Check if connected to server
    pub fn is_connected(&self) -> bool {
        self.connected
    }

    /// Get the server URL
    pub fn server_url(&self) -> &str {
        &self.server_url
    }

    /// Reset loader state
    pub fn reset(&mut self) {
        self.memory.clear();
        self.frames_received = 0;
        self.bytes_received = 0;
        self.connected = false;
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_new_loader() {
        let loader = NetLoader::new("ws://localhost:8765");
        assert_eq!(loader.server_url(), "ws://localhost:8765");
        assert!(!loader.is_connected());
        assert_eq!(loader.stats(), (0, 0));
    }

    #[test]
    fn test_empty_memory() {
        let loader = NetLoader::new("ws://localhost:8765");
        let memory = loader.get_memory();
        assert!(memory.is_empty());
    }

    #[test]
    fn test_reset() {
        let mut loader = NetLoader::new("ws://localhost:8765");
        loader.memory.insert(0, vec![1, 2, 3]);
        loader.frames_received = 1;
        loader.bytes_received = 3;
        loader.connected = true;

        loader.reset();

        assert_eq!(loader.stats(), (0, 0));
        assert!(!loader.is_connected());
    }
}
