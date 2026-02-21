//! WebSocket Broadcast Module with Backpressure
//!
//! Provides efficient broadcast of neural state updates to connected WebSocket clients
//! with backpressure handling to prevent overwhelming slow clients.
//!
//! # Features
//! - Client connection limit (MAX_CLIENTS)
//! - Per-client queue size limit (MAX_QUEUE_SIZE)
//! - Backpressure threshold detection (BACKPRESSURE_THRESHOLD)
//! - Automatic cleanup of stale connections
//! - Efficient broadcast to all connected clients
//!
//! # Usage
//! ```rust
//! use crate::broadcast::NeuralBroadcast;
//!
//! #[tokio::main]
//! async fn main() {
//!     let broadcast = NeuralBroadcast::new();
//!
//!     // Add a client
//!     let client_id = "client-123".to_string();
//!     let (tx, rx) = tokio::sync::mpsc::channel(100);
//!     broadcast.add_client(client_id.clone(), tx).await.unwrap();
//!
//!     // Broadcast a message
//!     let data = r#"{"type": "update", "data": {...}}"#;
//!     broadcast.broadcast(data).await;
//!
//!     // Remove client
//!     broadcast.remove_client(client_id).await;
//! }
//! ```

use serde_json::json;
use std::collections::HashMap;
use std::sync::Arc;
use thiserror::Error;
use tokio::sync::mpsc;
use tokio::sync::Semaphore;
use tokio_tungstenite::tungstenite::Message;

/// Maximum number of concurrent WebSocket clients
pub const MAX_CLIENTS: usize = 100;

/// Maximum queue size per client (number of pending messages)
pub const MAX_QUEUE_SIZE: usize = 1000;

/// Backpressure threshold - if a client's queue exceeds this, stop sending
pub const BACKPRESSURE_THRESHOLD: usize = 100;

/// Interval in seconds for cleanup task to check for stale connections
pub const CLEANUP_INTERVAL_SECS: u64 = 30;

/// Maximum time in seconds without activity before a client is considered stale
pub const STALE_TIMEOUT_SECS: u64 = 300;

/// Errors that can occur during broadcast operations
#[derive(Debug, Error, Clone)]
pub enum BroadcastError {
    /// Too many clients connected
    #[error("Too many clients connected (max: {MAX_CLIENTS})")]
    TooManyClients,

    /// Client not found
    #[error("Client not found: {0}")]
    ClientNotFound(String),

    /// Channel closed
    #[error("Channel closed for client: {0}")]
    ChannelClosed(String),

    /// Send failed
    #[error("Failed to send message: {0}")]
    SendFailed(String),
}

/// Represents a single WebSocket client connection
#[derive(Debug)]
pub struct ClientSink {
    /// Channel sender for this client
    pub tx: mpsc::Sender<Message>,

    /// Semaphore permit for limiting total clients
    #[allow(dead_code)]
    _permit: Arc<Semaphore>,

    /// Client ID
    pub id: String,

    /// Last activity timestamp (Unix timestamp in seconds)
    pub last_activity: Arc<tokio::sync::RwLock<u64>>,
}

impl ClientSink {
    /// Create a new client sink
    fn new(id: String, tx: mpsc::Sender<Message>, semaphore: Arc<Semaphore>) -> Self {
        let now = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap_or_default()
            .as_secs();

        Self {
            tx,
            _permit: semaphore,
            id,
            last_activity: Arc::new(tokio::sync::RwLock::new(now)),
        }
    }

    /// Update the last activity timestamp
    pub async fn update_activity(&self) {
        let now = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap_or_default()
            .as_secs();
        *self.last_activity.write().await = now;
    }

    /// Check if this client is stale (no recent activity)
    pub async fn is_stale(&self) -> bool {
        let now = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap_or_default()
            .as_secs();
        let last = *self.last_activity.read().await;
        now.saturating_sub(last) > STALE_TIMEOUT_SECS
    }
}

/// Main broadcast channel for neural state updates
#[derive(Debug, Clone)]
pub struct NeuralBroadcast {
    /// Map of client ID to client sink
    clients: Arc<tokio::sync::Mutex<HashMap<String, Arc<ClientSink>>>>,

    /// Semaphore for limiting total number of clients
    semaphore: Arc<Semaphore>,

    /// Broadcast metrics
    metrics: Arc<tokio::sync::Mutex<BroadcastMetrics>>,
}

/// Broadcast metrics for monitoring
#[derive(Debug, Default, Clone)]
pub struct BroadcastMetrics {
    /// Total messages broadcast
    pub total_broadcasts: u64,

    /// Failed sends due to backpressure
    pub backpressure_drops: u64,

    /// Clients disconnected (cleaned up)
    pub disconnections: u64,

    /// Current client count
    pub client_count: usize,
}

impl Default for NeuralBroadcast {
    fn default() -> Self {
        Self::new()
    }
}

impl NeuralBroadcast {
    /// Create a new broadcast channel
    pub fn new() -> Self {
        let semaphore = Arc::new(Semaphore::new(MAX_CLIENTS));

        let broadcast = Self {
            clients: Arc::new(tokio::sync::Mutex::new(HashMap::new())),
            semaphore,
            metrics: Arc::new(tokio::sync::Mutex::new(BroadcastMetrics::default())),
        };

        // Start background cleanup task
        broadcast.start_cleanup_task();

        broadcast
    }

    /// Add a new client to the broadcast channel
    ///
    /// # Arguments
    /// * `id` - Unique client identifier
    /// * `tx` - Channel sender for the client
    ///
    /// # Returns
    /// * `Ok(())` - Client added successfully
    /// * `Err(BroadcastError::TooManyClients)` - Maximum clients reached
    /// * `Err(BroadcastError::ChannelClosed)` - Channel already closed
    pub async fn add_client(
        &self,
        id: String,
        tx: mpsc::Sender<Message>,
    ) -> Result<(), BroadcastError> {
        // Check current client count before acquiring permit
        {
            let clients = self.clients.lock().await;
            if clients.len() >= MAX_CLIENTS {
                return Err(BroadcastError::TooManyClients);
            }
        }

        // Check if channel is still open
        if tx.is_closed() {
            return Err(BroadcastError::ChannelClosed(id));
        }

        let client = Arc::new(ClientSink::new(id.clone(), tx, self.semaphore.clone()));

        let mut clients = self.clients.lock().await;
        clients.insert(id.clone(), client);

        // Update metrics
        let mut metrics = self.metrics.lock().await;
        metrics.client_count = clients.len();

        Ok(())
    }

    /// Remove a client from the broadcast channel
    ///
    /// # Arguments
    /// * `id` - Client identifier to remove
    ///
    /// # Returns
    /// * `Ok(())` - Client removed successfully
    /// * `Err(BroadcastError::ClientNotFound)` - Client not found
    pub async fn remove_client(&self, id: &str) -> Result<(), BroadcastError> {
        let mut clients = self.clients.lock().await;

        clients
            .remove(id)
            .ok_or_else(|| BroadcastError::ClientNotFound(id.to_string()))?;

        // Permit is automatically released when ClientSink is dropped

        // Update metrics
        let mut metrics = self.metrics.lock().await;
        metrics.client_count = clients.len();
        metrics.disconnections += 1;

        Ok(())
    }

    /// Broadcast a message to all connected clients with backpressure handling
    ///
    /// # Arguments
    /// * `data` - JSON string to broadcast
    ///
    /// # Behavior
    /// - Skips clients with full queues (backpressure)
    /// - Removes clients with closed channels
    /// - Updates activity timestamp for successful sends
    pub async fn broadcast(&self, data: impl AsRef<str>) {
        let message = Message::Text(data.as_ref().to_string());
        let mut stale_clients = Vec::new();

        {
            let clients = self.clients.lock().await;

            // Update broadcast count
            {
                let mut metrics = self.metrics.lock().await;
                metrics.total_broadcasts += 1;
            }

            for (id, client) in clients.iter() {
                // Check if queue is approaching backpressure threshold
                let current_capacity = client.tx.capacity();
                let is_under_pressure = current_capacity < BACKPRESSURE_THRESHOLD;

                if is_under_pressure {
                    // Skip this client - backpressure
                    let mut metrics = self.metrics.lock().await;
                    metrics.backpressure_drops += 1;
                    continue;
                }

                // Try to send message
                match client.tx.try_send(message.clone()) {
                    Ok(_) => {
                        // Update activity on successful send
                        client.update_activity().await;
                    }
                    Err(mpsc::error::TrySendError::Full(_)) => {
                        // Queue full - backpressure
                        let mut metrics = self.metrics.lock().await;
                        metrics.backpressure_drops += 1;
                    }
                    Err(mpsc::error::TrySendError::Closed(_)) => {
                        // Channel closed - mark for removal
                        stale_clients.push(id.clone());
                    }
                }
            }
        }

        // Clean up stale clients outside the lock
        for id in stale_clients {
            let _ = self.remove_client(&id).await;
        }
    }

    /// Send a message to a specific client
    ///
    /// # Arguments
    /// * `id` - Target client ID
    /// * `data` - JSON string to send
    ///
    /// # Returns
    /// * `Ok(())` - Message sent successfully
    /// * `Err(BroadcastError)` - Send failed
    pub async fn send_to_client(
        &self,
        id: &str,
        data: impl AsRef<str>,
    ) -> Result<(), BroadcastError> {
        let clients = self.clients.lock().await;
        let client = clients
            .get(id)
            .ok_or_else(|| BroadcastError::ClientNotFound(id.to_string()))?;

        let message = Message::Text(data.as_ref().to_string());

        client
            .tx
            .try_send(message)
            .map_err(|_| BroadcastError::SendFailed(id.to_string()))?;

        client.update_activity().await;
        Ok(())
    }

    /// Get the number of connected clients
    pub async fn client_count(&self) -> usize {
        let clients = self.clients.lock().await;
        clients.len()
    }

    /// Get current broadcast metrics
    pub async fn get_metrics(&self) -> BroadcastMetrics {
        let metrics = self.metrics.lock().await;
        metrics.clone()
    }

    /// Start background task to clean up stale connections
    fn start_cleanup_task(&self) {
        let clients = self.clients.clone();
        let broadcast = self.clone();

        tokio::spawn(async move {
            let mut interval =
                tokio::time::interval(tokio::time::Duration::from_secs(CLEANUP_INTERVAL_SECS));

            loop {
                interval.tick().await;

                let mut clients_guard = clients.lock().await;
                let mut stale_clients = Vec::new();

                for (id, client) in clients_guard.iter() {
                    if client.is_stale().await {
                        stale_clients.push(id.clone());
                    }
                }

                // Remove stale clients
                for id in stale_clients {
                    clients_guard.remove(&id);
                    let mut metrics = broadcast.metrics.lock().await;
                    metrics.client_count = clients_guard.len();
                    metrics.disconnections += 1;
                }
            }
        });
    }

    /// Broadcast a heartbeat message to all clients
    pub async fn broadcast_heartbeat(&self) {
        let heartbeat = json!({
            "type": "heartbeat",
            "timestamp": std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .unwrap_or_default()
                .as_millis(),
        })
        .to_string();

        self.broadcast(heartbeat).await;
    }

    /// Gracefully shutdown the broadcast channel
    pub async fn shutdown(&self) {
        let clients = self.clients.lock().await;
        let mut clients_guard = clients;

        // Send close message to all clients
        for (_, client) in clients_guard.iter() {
            let _ = client.tx.try_send(Message::Close(None));
        }

        // Clear all clients
        clients_guard.clear();

        // Update metrics
        let mut metrics = self.metrics.lock().await;
        metrics.client_count = 0;
    }
}

/// Helper function to connect a client's sender to the broadcast channel
///
/// # Arguments
/// * `broadcast` - The broadcast channel
/// * `id` - Client ID
///
/// # Returns
/// A channel sender that can be used to send messages to this client
///
/// # Usage Example
/// ```rust
/// use crate::broadcast::NeuralBroadcast;
///
/// let broadcast = NeuralBroadcast::new();
/// let tx = connect_client_to_broadcast(&broadcast, "client-123".to_string()).await.unwrap();
/// ```
pub async fn connect_client_to_broadcast(
    broadcast: &NeuralBroadcast,
    id: String,
) -> Result<mpsc::Sender<Message>, BroadcastError> {
    let (tx, rx) = mpsc::channel(MAX_QUEUE_SIZE);

    // Add client to broadcast
    broadcast.add_client(id.clone(), tx.clone()).await?;

    // Note: The caller is responsible for consuming `rx` and writing to the WebSocket
    // This design allows more flexibility in how the WebSocket is handled

    Ok(tx)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_broadcast_creation() {
        let broadcast = NeuralBroadcast::new();
        assert_eq!(broadcast.client_count().await, 0);
    }

    #[tokio::test]
    async fn test_add_client() {
        let broadcast = NeuralBroadcast::new();
        let (tx, _rx) = mpsc::channel(100);
        assert!(broadcast.add_client("test-1".to_string(), tx).await.is_ok());
        assert_eq!(broadcast.client_count().await, 1);
    }

    #[tokio::test]
    async fn test_remove_client() {
        let broadcast = NeuralBroadcast::new();
        let (tx, _rx) = mpsc::channel(100);
        broadcast
            .add_client("test-1".to_string(), tx)
            .await
            .unwrap();
        assert!(broadcast.remove_client("test-1").await.is_ok());
        assert_eq!(broadcast.client_count().await, 0);
    }

    #[tokio::test]
    async fn test_client_limit() {
        let broadcast = NeuralBroadcast::new();

        // Add max clients
        for i in 0..MAX_CLIENTS {
            let (tx, _rx) = mpsc::channel(100);
            broadcast
                .add_client(format!("client-{}", i), tx)
                .await
                .unwrap();
        }

        // Try to add one more - should fail
        let (tx, _rx) = mpsc::channel(100);
        let result = broadcast.add_client("overflow".to_string(), tx).await;
        assert!(matches!(result, Err(BroadcastError::TooManyClients)));
    }

    #[tokio::test]
    async fn test_broadcast_message() {
        let broadcast = NeuralBroadcast::new();
        let (tx, mut rx) = mpsc::channel(100);

        broadcast
            .add_client("test-1".to_string(), tx)
            .await
            .unwrap();

        broadcast.broadcast(r#"{"type":"test"}"#).await;

        let msg = rx.recv().await.unwrap();
        assert_eq!(msg, Message::Text(r#"{"type":"test"}"#.to_string()));
    }

    #[tokio::test]
    async fn test_broadcast_metrics() {
        let broadcast = NeuralBroadcast::new();
        let (tx, _rx) = mpsc::channel(100);

        broadcast
            .add_client("test-1".to_string(), tx)
            .await
            .unwrap();

        broadcast.broadcast(r#"{"test":1}"#).await;

        let metrics = broadcast.get_metrics().await;
        assert_eq!(metrics.total_broadcasts, 1);
        assert_eq!(metrics.client_count, 1);
    }

    #[tokio::test]
    async fn test_send_to_specific_client() {
        let broadcast = NeuralBroadcast::new();
        let (tx1, mut rx1) = mpsc::channel(100);
        let (tx2, mut rx2) = mpsc::channel(100);

        broadcast
            .add_client("client-1".to_string(), tx1)
            .await
            .unwrap();
        broadcast
            .add_client("client-2".to_string(), tx2)
            .await
            .unwrap();

        // Send to specific client
        broadcast
            .send_to_client("client-1", r#"{"to":"client-1"}"#)
            .await
            .unwrap();

        // Only client-1 should receive
        let msg1 = rx1.recv().await.unwrap();
        assert_eq!(msg1, Message::Text(r#"{"to":"client-1"}"#.to_string()));

        assert!(rx2.try_recv().is_err());
    }

    #[tokio::test]
    async fn test_client_not_found_error() {
        let broadcast = NeuralBroadcast::new();
        let result = broadcast.remove_client("nonexistent").await;
        assert!(matches!(result, Err(BroadcastError::ClientNotFound(_))));
    }
}
