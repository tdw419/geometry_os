// systems/infinite_map_rs/src/glass_ram/glass_ram_integration.rs
//
// Phase 33.4: Kernel Integration
// Integrates fault polling with compressed sensing reconstruction for real-time memory visualization

use crate::glass_ram::compressed_sensing::CompressedSensingReconstructor;
use crate::glass_ram::fault_poller::FaultEvent;
use crate::glass_ram::hilbert_skilling::Hilbert3D;
use ndarray::Array2;
use std::sync::Arc;
use tokio::sync::RwLock;

/// Configuration for the Glass RAM integration
#[derive(Debug, Clone)]
pub struct GlassRamConfig {
    /// Hilbert curve order (resolution = 2^order)
    pub hilbert_order: u32,
    /// Sparsity threshold for compressed sensing (0.0 to 1.0)
    pub sparsity_threshold: f32,
    /// Decay factor for temporal smoothing (0.0 to 1.0)
    pub decay_factor: f32,
    /// Batch size for reconstruction
    pub batch_size: usize,
}

impl Default for GlassRamConfig {
    fn default() -> Self {
        Self {
            hilbert_order: 10,       // 1024x1024 grid
            sparsity_threshold: 0.1, // 10% Nyquist constraint
            decay_factor: 0.9,       // 10% decay per frame
            batch_size: 100,         // Process 100 faults per batch
        }
    }
}

/// Integrated Glass RAM system
/// 
/// Combines fault event polling with compressed sensing reconstruction
/// to provide real-time memory density visualization.
pub struct GlassRamIntegration {
    config: GlassRamConfig,
    reconstructor: CompressedSensingReconstructor,
    hilbert: Hilbert3D,
    fault_buffer: Vec<FaultEvent>,
    frame_count: u64,
}

impl GlassRamIntegration {
    /// Create a new Glass RAM integration with default configuration
    pub fn new() -> Self {
        Self::with_config(GlassRamConfig::default())
    }

    /// Create a new Glass RAM integration with custom configuration
    pub fn with_config(config: GlassRamConfig) -> Self {
        let reconstructor = CompressedSensingReconstructor::new(
            config.hilbert_order,
            config.sparsity_threshold,
        );
        let hilbert = Hilbert3D::new(config.hilbert_order);

        Self {
            config: config.clone(),
            reconstructor,
            hilbert,
            fault_buffer: Vec::with_capacity(config.batch_size),
            frame_count: 0,
        }
    }

    /// Process a single fault event
    /// 
    /// Events are buffered and processed in batches for efficiency.
    pub fn process_fault(&mut self, event: FaultEvent) {
        self.fault_buffer.push(event);

        if self.fault_buffer.len() >= self.config.batch_size {
            self.flush_buffer();
        }
    }

    /// Process a batch of fault events
    pub fn process_faults(&mut self, events: &[FaultEvent]) {
        for event in events {
            self.fault_buffer.push(event.clone());
        }

        if self.fault_buffer.len() >= self.config.batch_size {
            self.flush_buffer();
        }
    }

    /// Flush the fault buffer and perform reconstruction
    fn flush_buffer(&mut self) {
        if self.fault_buffer.is_empty() {
            return;
        }

        // Perform reconstruction
        if let Err(e) = self.reconstructor.reconstruct(&self.fault_buffer) {
            log::error!("Reconstruction error: {}", e);
        }

        self.fault_buffer.clear();
        self.frame_count += 1;

        // Log reconstruction accuracy
        if self.frame_count % 100 == 0 {
            let accuracy = self.reconstructor.accuracy();
            log::debug!("Frame {}: Reconstruction accuracy: {:.2}%", 
                self.frame_count, accuracy * 100.0);
        }
    }

    /// Get the current density map
    pub fn density_map(&self) -> &Array2<f32> {
        // Ensure buffer is flushed before returning
        if !self.fault_buffer.is_empty() {
            log::warn!("Returning density map with unprocessed faults in buffer");
        }
        self.reconstructor.current_density()
    }

    /// Get the current reconstruction accuracy
    pub fn accuracy(&self) -> f32 {
        self.reconstructor.accuracy()
    }

    /// Get the frame count
    pub fn frame_count(&self) -> u64 {
        self.frame_count
    }

    /// Get the Hilbert curve mapper
    pub fn hilbert(&self) -> &Hilbert3D {
        &self.hilbert
    }

    /// Map a memory address to Hilbert 3D coordinates
    pub fn address_to_hilbert(&self, address: u64) -> (u32, u32, u32) {
        let page_idx = (address >> 12) as u32;
        let max_idx = 1u32 << (self.config.hilbert_order * 3);
        let scaled_idx = page_idx % max_idx;
        self.hilbert.d_to_xyz(scaled_idx as u64)
    }

    /// Map Hilbert 3D coordinates to a memory address (approximate)
    pub fn hilbert_to_address(&self, x: u32, y: u32, z: u32) -> u64 {
        let d = self.hilbert.xyz_to_d(x, y, z);
        (d as u64) << 12 // Convert to byte address (4KB pages)
    }

    /// Get the resolution of the density map
    pub fn resolution(&self) -> usize {
        1 << self.config.hilbert_order
    }

    /// Reset the integration state
    pub fn reset(&mut self) {
        self.fault_buffer.clear();
        self.frame_count = 0;
        // Note: We don't reset the reconstructor's density map
        // to preserve temporal continuity
    }

    /// Get statistics about the current state
    pub fn stats(&self) -> GlassRamStats {
        let density = self.density_map();
        let non_zero = density.iter().filter(|&&v| v > 0.01).count();
        let max_density = density.iter().cloned().fold(0.0f32, f32::max);
        let total_density: f32 = density.iter().sum();

        GlassRamStats {
            frame_count: self.frame_count,
            buffered_faults: self.fault_buffer.len(),
            non_zero_cells: non_zero,
            total_cells: density.len(),
            max_density,
            total_density,
            accuracy: self.accuracy(),
            resolution: self.resolution(),
        }
    }
}

/// Statistics about the Glass RAM integration
#[derive(Debug, Clone)]
pub struct GlassRamStats {
    pub frame_count: u64,
    pub buffered_faults: usize,
    pub non_zero_cells: usize,
    pub total_cells: usize,
    pub max_density: f32,
    pub total_density: f32,
    pub accuracy: f32,
    pub resolution: usize,
}

impl std::fmt::Display for GlassRamStats {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "GlassRamStats {{\n")?;
        write!(f, "  frame_count: {},\n", self.frame_count)?;
        write!(f, "  buffered_faults: {},\n", self.buffered_faults)?;
        write!(f, "  non_zero_cells: {} / {} ({:.2}%),\n", 
            self.non_zero_cells, self.total_cells,
            (self.non_zero_cells as f32 / self.total_cells as f32) * 100.0)?;
        write!(f, "  max_density: {:.2},\n", self.max_density)?;
        write!(f, "  total_density: {:.2},\n", self.total_density)?;
        write!(f, "  accuracy: {:.2}%,\n", self.accuracy * 100.0)?;
        write!(f, "  resolution: {}x{},\n", self.resolution, self.resolution)?;
        write!(f, "}}")
    }
}

/// Thread-safe wrapper for Glass RAM integration
/// 
/// Allows concurrent access to the integration state from multiple threads.
pub struct SharedGlassRamIntegration {
    inner: Arc<RwLock<GlassRamIntegration>>,
}

impl SharedGlassRamIntegration {
    /// Create a new shared Glass RAM integration
    pub fn new() -> Self {
        Self {
            inner: Arc::new(RwLock::new(GlassRamIntegration::new())),
        }
    }

    /// Create a new shared Glass RAM integration with custom configuration
    pub fn with_config(config: GlassRamConfig) -> Self {
        Self {
            inner: Arc::new(RwLock::new(GlassRamIntegration::with_config(config))),
        }
    }

    /// Process a fault event
    pub async fn process_fault(&self, event: FaultEvent) {
        let mut inner = self.inner.write().await;
        inner.process_fault(event);
    }

    /// Process a batch of fault events
    pub async fn process_faults(&self, events: Vec<FaultEvent>) {
        let mut inner = self.inner.write().await;
        inner.process_faults(&events);
    }

    /// Get a copy of the current density map
    pub async fn density_map(&self) -> Array2<f32> {
        let inner = self.inner.read().await;
        inner.density_map().clone()
    }

    /// Get the current accuracy
    pub async fn accuracy(&self) -> f32 {
        let inner = self.inner.read().await;
        inner.accuracy()
    }

    /// Get statistics
    pub async fn stats(&self) -> GlassRamStats {
        let inner = self.inner.read().await;
        inner.stats()
    }

    /// Map a memory address to Hilbert coordinates
    pub async fn address_to_hilbert(&self, address: u64) -> (u32, u32, u32) {
        let inner = self.inner.read().await;
        inner.address_to_hilbert(address)
    }

    /// Reset the integration state
    pub async fn reset(&self) {
        let mut inner = self.inner.write().await;
        inner.reset();
    }

    /// Get a clone of the inner Arc for sharing
    pub fn inner(&self) -> Arc<RwLock<GlassRamIntegration>> {
        Arc::clone(&self.inner)
    }
}

impl Clone for SharedGlassRamIntegration {
    fn clone(&self) -> Self {
        Self {
            inner: Arc::clone(&self.inner),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_config_default() {
        let config = GlassRamConfig::default();
        assert_eq!(config.hilbert_order, 10);
        assert_eq!(config.sparsity_threshold, 0.1);
        assert_eq!(config.decay_factor, 0.9);
        assert_eq!(config.batch_size, 100);
    }

    #[test]
    fn test_integration_creation() {
        let integration = GlassRamIntegration::new();
        assert_eq!(integration.frame_count(), 0);
        assert_eq!(integration.resolution(), 1024);
    }

    #[test]
    fn test_process_single_fault() {
        let mut integration = GlassRamIntegration::new();
        let fault = FaultEvent::PageFault {
            address: 0x1000,
            flags: 0x1,
            thread_id: Some(1),
        };
        integration.process_fault(fault);
        // Fault should be buffered, not processed yet
        assert_eq!(integration.frame_count(), 0);
    }

    #[test]
    fn test_process_batch_faults() {
        let mut integration = GlassRamIntegration::with_config(GlassRamConfig {
            batch_size: 10,
            ..Default::default()
        });

        for i in 0..10 {
            integration.process_fault(FaultEvent::PageFault {
                address: (i as u64) * 0x1000,
                flags: 0x1,
                thread_id: Some(1),
            });
        }

        // Should have processed one batch
        assert_eq!(integration.frame_count(), 1);
    }

    #[test]
    fn test_address_to_hilbert() {
        let integration = GlassRamIntegration::new();
        let (x, y, z) = integration.address_to_hilbert(0x1000);
        assert!(x < 1024 && y < 1024 && z < 1024);
    }

    #[test]
    fn test_hilbert_roundtrip() {
        let integration = GlassRamIntegration::new();
        let address = 0x12345000;
        let (x, y, z) = integration.address_to_hilbert(address);
        let recovered = integration.hilbert_to_address(x, y, z);
        // Note: This may not be exact due to modulo scaling
        // but should be in the same page
        assert!((recovered as i64 - address as i64).abs() < 0x1000);
    }

    #[test]
    fn test_stats() {
        let mut integration = GlassRamIntegration::with_config(GlassRamConfig {
            batch_size: 10,
            ..Default::default()
        });

        for i in 0..10 {
            integration.process_fault(FaultEvent::PageFault {
                address: (i as u64) * 0x1000,
                flags: 0x1,
                thread_id: Some(1),
            });
        }

        let stats = integration.stats();
        assert_eq!(stats.frame_count, 1);
        assert_eq!(stats.buffered_faults, 0);
        assert_eq!(stats.resolution, 1024);
    }

    #[test]
    fn test_display_stats() {
        let integration = GlassRamIntegration::new();
        let stats = integration.stats();
        let display = format!("{}", stats);
        assert!(display.contains("GlassRamStats"));
        assert!(display.contains("frame_count"));
    }
}
