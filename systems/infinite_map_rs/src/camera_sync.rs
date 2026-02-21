//! Camera Synchronization Bridge - WebSocket Server for Visual Shell
//!
//! This module provides a WebSocket server that broadcasts camera state
//! (position, zoom) to connected PixiJS visual shells, enabling synchronized
//! camera movement between the Rust compositor and web clients.

use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::sync::Arc;
use tokio::sync::{broadcast, RwLock};
use tokio_tungstenite::tungstenite::protocol::Message;
use futures_util::sink::SinkExt; // For send() method on WebSocket

/// Camera state update message
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CameraUpdate {
    /// Camera X position (world coordinates)
    pub x: f32,
    /// Camera Y position (world coordinates)
    pub y: f32,
    /// Camera zoom level
    pub zoom: f32,
    /// Target X position (for smooth interpolation)
    pub target_x: f32,
    /// Target Y position (for smooth interpolation)
    pub target_y: f32,
    /// Target zoom level (for smooth interpolation)
    pub target_zoom: f32,
    /// Timestamp of the update
    pub timestamp: u64,
}

/// Tile update message (when a tile changes)
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TileUpdate {
    /// Grid X coordinate
    pub x: i32,
    /// Grid Y coordinate
    pub y: i32,
    /// Brick/texture name
    pub brick: String,
    /// Timestamp
    pub timestamp: f64,
}

/// Message types sent over WebSocket
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(tag = "type")]
pub enum SyncMessage {
    /// Camera state update
    #[serde(rename = "camera_update")]
    Camera(CameraUpdate),
    /// Tile update
    #[serde(rename = "tile_update")]
    Tile(TileUpdate),
    /// Heartbeat (keep-alive)
    #[serde(rename = "heartbeat")]
    Heartbeat { timestamp: u64 },
    /// Cognitive State Update
    #[serde(rename = "cognitive_update")]
    Cognitive(serde_json::Value),
}

/// Connected client information
struct ConnectedClient {
    /// Client ID
    id: String,
    /// Last heartbeat timestamp
    last_heartbeat: std::time::Instant,
}

/// WebSocket server for camera synchronization
pub struct CameraSyncServer {
    /// Broadcast channel for camera updates
    camera_tx: broadcast::Sender<CameraUpdate>,
    /// Broadcast channel for tile updates
    tile_tx: broadcast::Sender<TileUpdate>,
    /// Broadcast channel for cognitive updates (flexible JSON)
    cognitive_tx: broadcast::Sender<serde_json::Value>,
    /// Connected clients
    clients: Arc<RwLock<HashMap<String, ConnectedClient>>>,
    /// Server address
    addr: String,
}

impl CameraSyncServer {
    /// Create a new camera sync server
    ///
    /// # Arguments
    /// * `addr` - WebSocket server address (e.g., "127.0.0.1:8765")
    pub fn new(addr: String) -> Self {
        let (camera_tx, _) = broadcast::channel(100);
        let (tile_tx, _) = broadcast::channel(100);
        let (cognitive_tx, _) = broadcast::channel(100);

        Self {
            camera_tx,
            tile_tx,
            cognitive_tx,
            clients: Arc::new(RwLock::new(HashMap::new())),
            addr,
        }
    }

    /// Create a camera sync server with default address
    pub fn default() -> Self {
        Self::new("127.0.0.1:8765".to_string())
    }

    /// Start the WebSocket server
    ///
    /// This spawns a background task that handles incoming connections
    /// and broadcasts camera updates to all connected clients.
    pub async fn start(&self) -> Result<(), Box<dyn std::error::Error>> {
        use tokio::net::TcpListener;
        use futures_util::stream::StreamExt;

        let listener = TcpListener::bind(&self.addr).await?;
        println!("🔌 Camera Sync WebSocket server listening on {}", self.addr);

        // Spawn heartbeat task
        let clients_heartbeat = Arc::clone(&self.clients);
        tokio::spawn(async move {
            let mut interval = tokio::time::interval(std::time::Duration::from_secs(30));
            loop {
                interval.tick().await;
                let mut clients = clients_heartbeat.write().await;
                let now = std::time::Instant::now();
                
                // Remove inactive clients (no heartbeat for 60 seconds)
                clients.retain(|_, client| {
                    now.duration_since(client.last_heartbeat).as_secs() < 60
                });
            }
        });

        // Accept connections
        while let Ok((stream, addr)) = listener.accept().await {
            let clients = Arc::clone(&self.clients);
            let mut camera_rx = self.camera_tx.subscribe();
            let mut tile_rx = self.tile_tx.subscribe();
            let mut cognitive_rx = self.cognitive_tx.subscribe();
            let client_id = format!("{}:{}", addr.ip(), addr.port());

            tokio::spawn(async move {
                use tokio_tungstenite::accept_async;

                // Accept WebSocket connection
                let ws_stream = match accept_async(stream).await {
                    Ok(ws) => ws,
                    Err(e) => {
                        eprintln!("Failed to accept WebSocket connection: {}", e);
                        return;
                    }
                };

                let (mut ws_sender, mut ws_receiver) = ws_stream.split();

                // Register client
                {
                    let mut clients_guard = clients.write().await;
                    clients_guard.insert(client_id.clone(), ConnectedClient {
                        id: client_id.clone(),
                        last_heartbeat: std::time::Instant::now(),
                    });
                }
                println!("🔗 Client connected: {}", client_id);

                // Spawn task to broadcast updates to this client
                let clients_broadcast = Arc::clone(&clients);
                let client_id_broadcast = client_id.clone();
                tokio::spawn(async move {
                    loop {
                        tokio::select! {
                            // Broadcast camera updates
                            Ok(camera_update) = camera_rx.recv() => {
                                let msg = SyncMessage::Camera(camera_update);
                                if let Ok(json) = serde_json::to_string(&msg) {
                                    if ws_sender.send(Message::Text(json)).await.is_err() {
                                        break;
                                    }
                                }
                            }
                            // Broadcast tile updates
                            Ok(tile_update) = tile_rx.recv() => {
                                let msg = SyncMessage::Tile(tile_update);
                                if let Ok(json) = serde_json::to_string(&msg) {
                                    if ws_sender.send(Message::Text(json)).await.is_err() {
                                        break;
                                    }
                                }
                            }
                            // Broadcast cognitive updates
                            Ok(cognitive_update) = cognitive_rx.recv() => {
                                let msg = SyncMessage::Cognitive(cognitive_update);
                                if let Ok(json) = serde_json::to_string(&msg) {
                                    if ws_sender.send(Message::Text(json)).await.is_err() {
                                        break;
                                    }
                                }
                            }
                            // Send heartbeat every 10 seconds
                            _ = tokio::time::sleep(std::time::Duration::from_secs(10)) => {
                                let msg = SyncMessage::Heartbeat {
                                    timestamp: std::time::SystemTime::now()
                                        .duration_since(std::time::UNIX_EPOCH)
                                        .unwrap()
                                        .as_secs(),
                                };
                                if let Ok(json) = serde_json::to_string(&msg) {
                                    if ws_sender.send(Message::Text(json)).await.is_err() {
                                        break;
                                    }
                                }
                            }
                        }
                    }
                });

                // Handle incoming messages from client
                while let Some(msg_result) = ws_receiver.next().await {
                    match msg_result {
                        Ok(Message::Text(text)) => {
                            // Handle client messages (e.g., heartbeat responses)
                            if let Ok(msg) = serde_json::from_str::<SyncMessage>(&text) {
                                if matches!(msg, SyncMessage::Heartbeat { .. }) {
                                    let mut clients_guard = clients.write().await;
                                    if let Some(client) = clients_guard.get_mut(&client_id) {
                                        client.last_heartbeat = std::time::Instant::now();
                                    }
                                }
                            }
                        }
                        Ok(Message::Close(_)) => {
                            println!("🔌 Client disconnected: {}", client_id);
                            break;
                        }
                        Err(e) => {
                            eprintln!("WebSocket error for {}: {}", client_id, e);
                            break;
                        }
                        _ => {}
                    }
                }

                // Unregister client
                {
                    let mut clients_guard = clients.write().await;
                    clients_guard.remove(&client_id);
                }
            });
        }

        Ok(())
    }

    /// Broadcast a camera update to all connected clients
    pub fn broadcast_camera(&self, x: f32, y: f32, zoom: f32, target_x: f32, target_y: f32, target_zoom: f32) {
        let update = CameraUpdate {
            x,
            y,
            zoom,
            target_x,
            target_y,
            target_zoom,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .unwrap()
                .as_secs(),
        };

        // Ignore send errors (no clients connected)
        let _ = self.camera_tx.send(update);
    }

    /// Broadcast a tile update to all connected clients
    pub fn broadcast_tile(&self, x: i32, y: i32, brick: String, timestamp: f64) {
        let update = TileUpdate {
            x,
            y,
            brick,
            timestamp,
        };

        // Ignore send errors (no clients connected)
        let _ = self.tile_tx.send(update);
    }

    /// Broadcast a generic cognitive state update
    pub fn broadcast(&self, msg: serde_json::Value) {
        // Ignore send errors
        let _ = self.cognitive_tx.send(msg);
    }

    /// Get the number of connected clients
    pub async fn client_count(&self) -> usize {
        self.clients.read().await.len()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_camera_update_serialization() {
        let update = CameraUpdate {
            x: 100.0,
            y: 200.0,
            zoom: 1.5,
            target_x: 150.0,
            target_y: 250.0,
            target_zoom: 2.0,
            timestamp: 1234567890,
        };

        let json = serde_json::to_string(&update).unwrap();
        let deserialized: CameraUpdate = serde_json::from_str(&json).unwrap();

        assert_eq!(deserialized.x, 100.0);
        assert_eq!(deserialized.y, 200.0);
        assert_eq!(deserialized.zoom, 1.5);
    }

    #[test]
    fn test_sync_message_serialization() {
        let msg = SyncMessage::Camera(CameraUpdate {
            x: 100.0,
            y: 200.0,
            zoom: 1.5,
            target_x: 150.0,
            target_y: 250.0,
            target_zoom: 2.0,
            timestamp: 1234567890,
        });

        let json = serde_json::to_string(&msg).unwrap();
        assert!(json.contains("\"type\":\"camera_update\""));
    }
}
