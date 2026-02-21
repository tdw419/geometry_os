// src/tool_manager.rs
// Tool Manager - Phase 2
// Manages multiple tool adapters and coordinates polling

use std::collections::HashMap;
use std::sync::Arc;
use std::time::Duration;
use tokio::sync::RwLock;
use std::sync::atomic::{AtomicU32, Ordering};

use crate::tool_adapter::{ToolAdapter, ToolMetrics};

/// Tool Manager for coordinating multiple adapters
pub struct ToolManager {
    /// Registered adapters
    adapters: Vec<Arc<dyn ToolAdapter + Send + Sync>>,
    
    /// Latest metrics from each adapter (indexed by adapter name)
    metrics: Arc<RwLock<HashMap<String, ToolMetrics>>>,
    
    /// Aggregated health score (0.0 - 1.0) stored as bits for synchronous access
    aggregated_health: Arc<AtomicU32>,
    
    /// Whether polling is active
    polling_active: Arc<RwLock<bool>>,
    
    /// Latest status summary for synchronous access
    status_summary: Arc<parking_lot::RwLock<String>>,
    
    /// Tokio runtime handle for background polling
    runtime_handle: Option<tokio::runtime::Handle>,
}

impl ToolManager {
    pub fn new() -> Self {
        log::info!("🔧 ToolManager: Initializing tool adapter system");

        Self {
            adapters: Vec::new(),
            metrics: Arc::new(RwLock::new(HashMap::new())),
            aggregated_health: Arc::new(AtomicU32::new(1.0f32.to_bits())),
            polling_active: Arc::new(RwLock::new(false)),
            status_summary: Arc::new(parking_lot::RwLock::new("Initializing...".to_string())),
            runtime_handle: None,
        }
    }

    pub fn register_adapter(&mut self, adapter: Arc<dyn ToolAdapter + Send + Sync>) {
        let name = adapter.name();
        
        if adapter.is_available() {
            log::info!("🔧 ToolManager: Registered adapter '{}'", name);
            self.adapters.push(adapter);
        } else {
            log::warn!("🔧 ToolManager: Adapter '{}' is not available, skipping", name);
        }
    }

    pub async fn start_polling(&mut self, runtime_handle: tokio::runtime::Handle) {
        if *self.polling_active.read().await {
            log::warn!("🔧 ToolManager: Polling already active");
            return;
        }

        self.runtime_handle = Some(runtime_handle.clone());
        *self.polling_active.write().await = true;

        log::info!("🔧 ToolManager: Starting background polling loops for {} adapters", 
                   self.adapters.len());

        // Snapshot adapter info for the loop
        let adapters_to_poll = self.adapters.clone();
        let metrics_store = Arc::clone(&self.metrics);
        let active_flag = Arc::clone(&self.polling_active);
        let agg_health = Arc::clone(&self.aggregated_health);
        let status_sum = Arc::clone(&self.status_summary);

        runtime_handle.spawn(async move {
            log::info!("🔧 ToolManager: Main polling controller started");
            
            while *active_flag.read().await {
                let mut total_weight = 0.0;
                let mut weighted_sum = 0.0;
                let mut new_summary = String::new();

                for adapter in &adapters_to_poll {
                    let name = adapter.name().to_string();
                    match adapter.poll() {
                        Ok(metrics) => {
                            let weight = adapter.weight();
                            weighted_sum += metrics.health_score * weight;
                            total_weight += weight;
                            
                            new_summary.push_str(&format!("{}: {}\n", name, metrics.status));
                            
                            // Update internal store
                            let mut map = metrics_store.write().await;
                            map.insert(name, metrics);
                        }
                        Err(e) => {
                            log::error!("🔧 ToolManager: Error polling '{}': {}", name, e);
                            new_summary.push_str(&format!("{}: ERROR\n", name));
                        }
                    }
                }

                if total_weight > 0.0 {
                    let health = weighted_sum / total_weight;
                    agg_health.store(health.to_bits(), Ordering::Relaxed);
                }
                
                {
                    let mut sum_guard = status_sum.write();
                    *sum_guard = new_summary;
                }

                tokio::time::sleep(Duration::from_secs(1)).await;
            }
            log::info!("🔧 ToolManager: Main polling controller stopped");
        });
    }

    /// Synchronous access toaggregated health score
    pub fn get_health_sync(&self) -> f32 {
        f32::from_bits(self.aggregated_health.load(Ordering::Relaxed))
    }

    /// Synchronous access to status summary
    pub fn get_status_summary_sync(&self) -> String {
        self.status_summary.read().clone()
    }

    pub async fn stop_polling(&self) {
        *self.polling_active.write().await = false;
        log::info!("🔧 ToolManager: Stopping background polling");
    }

    pub fn adapter_count(&self) -> usize {
        self.adapters.len()
    }
}
