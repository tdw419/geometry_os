//! Vector Memory Client - Rust client for the Hippocampus vector memory daemon
//!
//! Provides socket communication with the Python vector_memory_daemon.py
//! for storing and retrieving semantic memories with PostgreSQL + pgvector.

use serde::{Deserialize, Serialize};
use std::io::{Read, Write};
use std::os::unix::net::UnixStream;

/// Message types for vector memory communication
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum VectorMemoryMessage {
    /// Store a thought pixel
    StoreThought {
        token_id: u32,
        token: String,
        embedding: Vec<f32>,
        hilbert_x: f32,
        hilbert_y: f32,
        layer: u32,
        activation: f32,
        session_id: String,
        timestamp: f64,
    },
    /// Recall semantic memories
    RecallMemories {
        query_vector: Vec<f32>,
        limit: usize,
        threshold: f32,
        exclude_session: Option<String>,
    },
    /// Get memory beam for visualization
    GetMemoryBeam {
        query_vector: Vec<f32>,
        current_x: f32,
        current_y: f32,
        limit: usize,
    },
    /// Get statistics
    GetStats,
}

/// Response types from the daemon
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum VectorMemoryResponse {
    StoreThoughtResponse { success: bool },
    RecallMemoriesResponse { memories: Vec<MemoryPixel> },
    GetMemoryBeamResponse { beam: Vec<MemoryPixel> },
    GetStatsResponse { stats: MemoryStats },
}

/// Memory pixel data structure
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MemoryPixel {
    pub token_id: u32,
    pub token: String,
    pub embedding: Vec<f32>,
    pub hilbert_x: f32,
    pub hilbert_y: f32,
    pub layer: u32,
    pub activation: f32,
    pub session_id: String,
    pub timestamp: f64,
    pub similarity: Option<f32>,
    pub spatial_distance: Option<f32>,
}

/// Memory statistics
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MemoryStats {
    pub session_stats: SessionStats,
    pub store_count: u64,
    pub retrieve_count: u64,
    pub avg_retrieval_time: f64,
}

/// Session statistics
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SessionStats {
    pub session_id: String,
    pub total_thoughts: u64,
    pub avg_activation: f32,
    pub start_time: f64,
    pub end_time: f64,
    pub duration: f64,
}

/// Vector Memory Client for connecting to the daemon
pub struct VectorMemoryClient {
    pub socket_path: String,
    pub connected: bool,
    pub stream: Option<UnixStream>,
}

impl VectorMemoryClient {
    pub fn new(socket_path: &str) -> Self {
        Self {
            socket_path: socket_path.to_string(),
            connected: false,
            stream: None,
        }
    }

    pub fn connect(&mut self) -> Result<(), Box<dyn std::error::Error>> {
        match UnixStream::connect(&self.socket_path) {
            Ok(stream) => {
                self.stream = Some(stream);
                self.connected = true;
                Ok(())
            }
            Err(e) => {
                self.connected = false;
                Err(Box::new(e))
            }
        }
    }

    pub fn disconnect(&mut self) {
        self.stream = None;
        self.connected = false;
    }

    pub fn send_message(&self, message: VectorMemoryMessage) -> Result<VectorMemoryResponse, Box<dyn std::error::Error>> {
        if !self.connected || self.stream.is_none() {
            return Err("Not connected".into());
        }

        let mut stream = self.stream.as_ref().unwrap();

        // Convert message to JSON
        let message_json = match message {
            VectorMemoryMessage::StoreThought { token_id, token, embedding, hilbert_x, hilbert_y, layer, activation, session_id, timestamp } => {
                serde_json::json!({
                    "message_type": "StoreThought",
                    "payload": {
                        "token_id": token_id,
                        "token": token,
                        "embedding": embedding,
                        "hilbert_x": hilbert_x,
                        "hilbert_y": hilbert_y,
                        "layer": layer,
                        "activation": activation,
                        "session_id": session_id,
                        "timestamp": timestamp
                    }
                })
            }
            VectorMemoryMessage::RecallMemories { query_vector, limit, threshold, exclude_session } => {
                let mut payload = serde_json::json!({
                    "query_vector": query_vector,
                    "limit": limit,
                    "threshold": threshold
                });
                if let Some(session) = exclude_session {
                    payload["exclude_session"] = serde_json::Value::String(session);
                }
                serde_json::json!({
                    "message_type": "RecallMemories",
                    "payload": payload
                })
            }
            VectorMemoryMessage::GetMemoryBeam { query_vector, current_x, current_y, limit } => {
                serde_json::json!({
                    "message_type": "GetMemoryBeam",
                    "payload": {
                        "query_vector": query_vector,
                        "current_x": current_x,
                        "current_y": current_y,
                        "limit": limit
                    }
                })
            }
            VectorMemoryMessage::GetStats => {
                serde_json::json!({
                    "message_type": "GetStats"
                })
            }
        };

        // Send JSON message
        let data = serde_json::to_string(&message_json)?.into_bytes();
        stream.write_all(&data)?;
        stream.write_all(b"\n")?; // Add newline delimiter
        stream.flush()?;

        // Read response (simple line-based for now)
        use std::io::BufRead;
        let mut reader = std::io::BufReader::new(stream);
        let mut response_line = String::new();
        reader.read_line(&mut response_line)?;

        let response_json: serde_json::Value = serde_json::from_str(&response_line.trim())?;

        // Parse response based on message type
        match response_json["message_type"].as_str() {
            Some("StoreThoughtResponse") => {
                let success = response_json["success"].as_bool().unwrap_or(false);
                Ok(VectorMemoryResponse::StoreThoughtResponse { success })
            }
            Some("RecallMemoriesResponse") => {
                let memories: Vec<MemoryPixel> = serde_json::from_value(response_json["memories"].clone())?;
                Ok(VectorMemoryResponse::RecallMemoriesResponse { memories })
            }
            Some("GetMemoryBeamResponse") => {
                let beam: Vec<MemoryPixel> = serde_json::from_value(response_json["beam"].clone())?;
                Ok(VectorMemoryResponse::GetMemoryBeamResponse { beam })
            }
            Some("GetStatsResponse") => {
                let stats: MemoryStats = serde_json::from_value(response_json["stats"].clone())?;
                Ok(VectorMemoryResponse::GetStatsResponse { stats })
            }
            _ => Err("Unknown response type".into())
        }
    }

    /// Store a thought pixel
    pub fn store_thought(&self, pixel: MemoryPixel) -> Result<bool, Box<dyn std::error::Error>> {
        let message = VectorMemoryMessage::StoreThought {
            token_id: pixel.token_id,
            token: pixel.token,
            embedding: pixel.embedding,
            hilbert_x: pixel.hilbert_x,
            hilbert_y: pixel.hilbert_y,
            layer: pixel.layer,
            activation: pixel.activation,
            session_id: pixel.session_id,
            timestamp: pixel.timestamp,
        };

        match self.send_message(message)? {
            VectorMemoryResponse::StoreThoughtResponse { success } => Ok(success),
            _ => Err("Unexpected response type".into())
        }
    }

    /// Recall semantic memories
    pub fn recall_memories(&self, query_vector: Vec<f32>, limit: usize, threshold: f32, exclude_session: Option<String>) -> Result<Vec<MemoryPixel>, Box<dyn std::error::Error>> {
        let message = VectorMemoryMessage::RecallMemories {
            query_vector,
            limit,
            threshold,
            exclude_session,
        };

        match self.send_message(message)? {
            VectorMemoryResponse::RecallMemoriesResponse { memories } => Ok(memories),
            _ => Err("Unexpected response type".into())
        }
    }

    /// Get memory beam for visualization
    pub fn get_memory_beam(&self, query_vector: Vec<f32>, current_x: f32, current_y: f32, limit: usize) -> Result<Vec<MemoryPixel>, Box<dyn std::error::Error>> {
        let message = VectorMemoryMessage::GetMemoryBeam {
            query_vector,
            current_x,
            current_y,
            limit,
        };

        match self.send_message(message)? {
            VectorMemoryResponse::GetMemoryBeamResponse { beam } => Ok(beam),
            _ => Err("Unexpected response type".into())
        }
    }

    /// Get memory statistics
    pub fn get_stats(&self) -> Result<MemoryStats, Box<dyn std::error::Error>> {
        let message = VectorMemoryMessage::GetStats;

        match self.send_message(message)? {
            VectorMemoryResponse::GetStatsResponse { stats } => Ok(stats),
            _ => Err("Unexpected response type".into())
        }
    }
}