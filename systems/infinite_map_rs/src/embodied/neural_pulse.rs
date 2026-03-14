//! Neural Pulse Effects - Visual feedback for neural interactions
//!
//! This module implements a pulse effect system that creates visceral visual
//! feedback when users interact with neural nodes. Pulses propagate through
//! connected nodes, creating a sense of the network "responding" to interaction.

use glam::{Vec3, Vec4};
use std::collections::HashMap;
use std::time::{Duration, Instant};

/// Unique identifier for a pulse
pub type PulseId = u64;

/// Configuration for pulse behavior
#[derive(Debug, Clone)]
pub struct PulseConfig {
    /// Initial pulse radius in world units
    pub initial_radius: f32,
    /// Maximum pulse radius
    pub max_radius: f32,
    /// Expansion speed (units/sec)
    pub expansion_speed: f32,
    /// Initial intensity (0-1)
    pub initial_intensity: f32,
    /// Decay rate (intensity loss per second)
    pub decay_rate: f32,
    /// Color of the pulse (RGBA)
    pub color: Vec4,
    /// Whether pulse propagates to connected nodes
    pub propagate: bool,
    /// Propagation delay (seconds)
    pub propagation_delay: f32,
    /// Propagation intensity multiplier
    pub propagation_factor: f32,
    /// Number of rings for the pulse
    pub ring_count: u32,
    /// Time between rings
    pub ring_spacing: f32,
}

impl Default for PulseConfig {
    fn default() -> Self {
        Self {
            initial_radius: 0.5,
            max_radius: 10.0,
            expansion_speed: 5.0,
            initial_intensity: 1.0,
            decay_rate: 0.8,
            color: Vec4::new(0.0, 1.0, 0.5, 1.0), // Cyan-green
            propagate: true,
            propagation_delay: 0.1,
            propagation_factor: 0.6,
            ring_count: 3,
            ring_spacing: 0.15,
        }
    }
}

/// Active pulse effect
#[derive(Debug, Clone)]
pub struct Pulse {
    /// Unique identifier
    pub id: PulseId,
    /// Source node ID
    pub source_node: String,
    /// Current position (center of pulse)
    pub position: Vec3,
    /// Current radius
    pub radius: f32,
    /// Current intensity (0-1)
    pub intensity: f32,
    /// Configuration
    pub config: PulseConfig,
    /// Creation time
    pub created_at: Instant,
    /// Whether pulse has finished
    pub finished: bool,
    /// Propagation state (node_id -> delay_remaining)
    pub pending_propagations: HashMap<String, f32>,
    /// Ring phases (0-1 for each ring)
    pub ring_phases: Vec<f32>,
}

impl Pulse {
    /// Create a new pulse
    pub fn new(id: PulseId, source_node: String, position: Vec3, config: PulseConfig) -> Self {
        let ring_phases = (0..config.ring_count)
            .map(|i| i as f32 * config.ring_spacing)
            .collect();
        
        Self {
            id,
            source_node,
            position,
            radius: config.initial_radius,
            intensity: config.initial_intensity,
            config,
            created_at: Instant::now(),
            finished: false,
            pending_propagations: HashMap::new(),
            ring_phases,
        }
    }

    /// Update pulse state
    pub fn update(&mut self, dt: f32) {
        // Expand radius
        self.radius += self.config.expansion_speed * dt;
        
        // Decay intensity
        self.intensity -= self.config.decay_rate * dt;
        
        // Update ring phases
        for phase in &mut self.ring_phases {
            *phase = (*phase + dt * 2.0).min(1.0);
        }

        // Update pending propagations
        let mut to_trigger: Vec<String> = Vec::new();
        for (node_id, delay) in &mut self.pending_propagations {
            *delay -= dt;
            if *delay <= 0.0 {
                to_trigger.push(node_id.clone());
            }
        }
        
        // Remove triggered propagations
        for node_id in to_trigger {
            self.pending_propagations.remove(&node_id);
        }

        // Check if finished
        if self.intensity <= 0.0 || self.radius >= self.config.max_radius {
            self.finished = true;
        }
    }

    /// Get alpha for rendering (0-1)
    pub fn get_alpha(&self) -> f32 {
        self.intensity.max(0.0)
    }

    /// Get elapsed time since creation
    pub fn elapsed(&self) -> Duration {
        self.created_at.elapsed()
    }

    /// Queue propagation to a connected node
    pub fn queue_propagation(&mut self, node_id: String) {
        if !self.pending_propagations.contains_key(&node_id) {
            self.pending_propagations.insert(
                node_id,
                self.config.propagation_delay,
            );
        }
    }

    /// Get nodes ready for propagation
    pub fn get_ready_propagations(&self) -> Vec<String> {
        self.pending_propagations
            .iter()
            .filter(|(_, delay)| **delay <= 0.0)
            .map(|(node_id, _)| node_id.clone())
            .collect()
    }
}

/// Manager for all active pulse effects
#[derive(Debug, Default)]
pub struct PulseManager {
    /// Active pulses
    pulses: HashMap<PulseId, Pulse>,
    /// Next pulse ID
    next_id: PulseId,
    /// Default configuration
    default_config: PulseConfig,
    /// Pulse configurations by type
    config_by_type: HashMap<PulseType, PulseConfig>,
    /// Maximum concurrent pulses
    max_pulses: usize,
}

/// Types of pulses for different interactions
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum PulseType {
    /// Node selection pulse
    Selection,
    /// Node activation pulse (high activity)
    Activation,
    /// Node hover pulse
    Hover,
    /// Error/warning pulse
    Error,
    /// Connection pulse between nodes
    Connection,
    /// Exploration pulse (searching)
    Exploration,
    /// Success/confirmation pulse
    Success,
}

impl PulseManager {
    /// Create a new pulse manager
    pub fn new() -> Self {
        let mut config_by_type = HashMap::new();
        
        // Selection pulse - bright, fast
        config_by_type.insert(PulseType::Selection, PulseConfig {
            color: Vec4::new(1.0, 0.3, 0.5, 1.0), // Pink
            expansion_speed: 8.0,
            decay_rate: 1.2,
            ring_count: 2,
            ..Default::default()
        });
        
        // Activation pulse - intense, propagates
        config_by_type.insert(PulseType::Activation, PulseConfig {
            color: Vec4::new(1.0, 0.8, 0.0, 1.0), // Gold
            initial_intensity: 1.5,
            expansion_speed: 10.0,
            decay_rate: 0.5,
            propagate: true,
            propagation_factor: 0.8,
            ring_count: 5,
            ..Default::default()
        });
        
        // Hover pulse - subtle, slow
        config_by_type.insert(PulseType::Hover, PulseConfig {
            color: Vec4::new(0.5, 0.8, 1.0, 0.5), // Light blue
            initial_intensity: 0.4,
            expansion_speed: 2.0,
            decay_rate: 0.3,
            ring_count: 1,
            propagate: false,
            ..Default::default()
        });
        
        // Error pulse - red, urgent
        config_by_type.insert(PulseType::Error, PulseConfig {
            color: Vec4::new(1.0, 0.0, 0.0, 1.0), // Red
            initial_intensity: 1.5,
            expansion_speed: 15.0,
            decay_rate: 0.4,
            ring_count: 4,
            propagate: true,
            propagation_factor: 0.5,
            ..Default::default()
        });
        
        // Connection pulse - travels between nodes
        config_by_type.insert(PulseType::Connection, PulseConfig {
            color: Vec4::new(0.3, 1.0, 0.5, 1.0), // Green
            initial_radius: 0.2,
            max_radius: 3.0,
            expansion_speed: 3.0,
            decay_rate: 0.6,
            ring_count: 1,
            propagate: false,
            ..Default::default()
        });
        
        // Exploration pulse - purple, wandering
        config_by_type.insert(PulseType::Exploration, PulseConfig {
            color: Vec4::new(0.6, 0.3, 1.0, 0.8), // Purple
            expansion_speed: 4.0,
            decay_rate: 0.3,
            ring_count: 3,
            propagate: true,
            propagation_factor: 0.4,
            ..Default::default()
        });
        
        // Success pulse - green, satisfying
        config_by_type.insert(PulseType::Success, PulseConfig {
            color: Vec4::new(0.0, 1.0, 0.5, 1.0), // Green
            initial_intensity: 1.2,
            expansion_speed: 6.0,
            decay_rate: 0.5,
            ring_count: 3,
            propagate: false,
            ..Default::default()
        });

        Self {
            pulses: HashMap::new(),
            next_id: 0,
            default_config: PulseConfig::default(),
            config_by_type,
            max_pulses: 100,
        }
    }

    /// Emit a pulse at a node
    pub fn emit(&mut self, node_id: &str, position: Vec3, pulse_type: PulseType) -> PulseId {
        self.emit_with_config(node_id, position, self.get_config(pulse_type).clone())
    }

    /// Emit a pulse with custom configuration
    pub fn emit_with_config(&mut self, node_id: &str, position: Vec3, config: PulseConfig) -> PulseId {
        // Clean up finished pulses if at max
        if self.pulses.len() >= self.max_pulses {
            self.cleanup_finished();
        }
        
        // Still at max? Remove oldest
        if self.pulses.len() >= self.max_pulses {
            if let Some(oldest_id) = self.pulses.values()
                .min_by_key(|p| p.created_at)
                .map(|p| p.id)
            {
                self.pulses.remove(&oldest_id);
            }
        }

        let id = self.next_id;
        self.next_id += 1;
        
        let pulse = Pulse::new(id, node_id.to_string(), position, config);
        self.pulses.insert(id, pulse);
        
        id
    }

    /// Get configuration for a pulse type
    pub fn get_config(&self, pulse_type: PulseType) -> &PulseConfig {
        self.config_by_type.get(&pulse_type).unwrap_or(&self.default_config)
    }

    /// Update all pulses
    pub fn update(&mut self, dt: f32) {
        for pulse in self.pulses.values_mut() {
            pulse.update(dt);
        }
        
        // Remove finished pulses
        self.cleanup_finished();
    }

    /// Remove finished pulses
    fn cleanup_finished(&mut self) {
        let finished_ids: Vec<PulseId> = self.pulses
            .iter()
            .filter(|(_, p)| p.finished)
            .map(|(id, _)| *id)
            .collect();
        
        for id in finished_ids {
            self.pulses.remove(&id);
        }
    }

    /// Get all active pulses
    pub fn get_pulses(&self) -> impl Iterator<Item = &Pulse> {
        self.pulses.values().filter(|p| !p.finished)
    }

    /// Get pulse by ID
    pub fn get_pulse(&self, id: PulseId) -> Option<&Pulse> {
        self.pulses.get(&id)
    }

    /// Cancel a specific pulse
    pub fn cancel(&mut self, id: PulseId) {
        if let Some(pulse) = self.pulses.get_mut(&id) {
            pulse.finished = true;
        }
    }

    /// Cancel all pulses
    pub fn cancel_all(&mut self) {
        self.pulses.clear();
    }

    /// Get pulse count
    pub fn count(&self) -> usize {
        self.pulses.len()
    }

    /// Set maximum concurrent pulses
    pub fn set_max_pulses(&mut self, max: usize) {
        self.max_pulses = max;
    }
}

/// Visual pulse renderer data (for GPU upload)
#[derive(Debug, Clone, Copy)]
pub struct PulseRenderData {
    /// World position
    pub position: [f32; 3],
    /// Current radius
    pub radius: f32,
    /// Current intensity
    pub intensity: f32,
    /// Color (RGBA)
    pub color: [f32; 4],
    /// Ring count
    pub ring_count: u32,
    /// Ring phases
    pub ring_phases: [f32; 4],
}

impl From<&Pulse> for PulseRenderData {
    fn from(pulse: &Pulse) -> Self {
        let mut ring_phases = [0.0f32; 4];
        for (i, phase) in pulse.ring_phases.iter().take(4).enumerate() {
            ring_phases[i] = *phase;
        }
        
        Self {
            position: pulse.position.to_array(),
            radius: pulse.radius,
            intensity: pulse.intensity,
            color: pulse.config.color.to_array(),
            ring_count: pulse.config.ring_count,
            ring_phases,
        }
    }
}

/// Connection between nodes for pulse propagation
#[derive(Debug, Clone)]
pub struct NeuralConnection {
    pub source: String,
    pub target: String,
    pub strength: f32,
}

/// Network topology for pulse propagation
#[derive(Debug, Default)]
pub struct NeuralTopology {
    /// Connections indexed by source node
    connections: HashMap<String, Vec<NeuralConnection>>,
    /// Node positions
    node_positions: HashMap<String, Vec3>,
}

impl NeuralTopology {
    /// Create a new topology
    pub fn new() -> Self {
        Self {
            connections: HashMap::new(),
            node_positions: HashMap::new(),
        }
    }

    /// Add a connection
    pub fn add_connection(&mut self, source: String, target: String, strength: f32) {
        let conn = NeuralConnection {
            source: source.clone(),
            target: target.clone(),
            strength,
        };
        
        self.connections
            .entry(source)
            .or_insert_with(Vec::new)
            .push(conn);
    }

    /// Set node position
    pub fn set_node_position(&mut self, node_id: String, position: Vec3) {
        self.node_positions.insert(node_id, position);
    }

    /// Get connections from a node
    pub fn get_connections(&self, node_id: &str) -> Option<&Vec<NeuralConnection>> {
        self.connections.get(node_id)
    }

    /// Get node position
    pub fn get_position(&self, node_id: &str) -> Option<Vec3> {
        self.node_positions.get(node_id).copied()
    }

    /// Propagate pulses through the network
    pub fn propagate_pulses(&self, pulse_manager: &mut PulseManager) {
        let mut new_pulses: Vec<(String, Vec3, PulseConfig)> = Vec::new();
        
        for pulse in pulse_manager.get_pulses() {
            if !pulse.config.propagate {
                continue;
            }
            
            // Get connections from pulse source
            if let Some(connections) = self.get_connections(&pulse.source_node) {
                for conn in connections {
                    // Check if this propagation is pending
                    if pulse.pending_propagations.contains_key(&conn.target) {
                        // Get target position
                        if let Some(&position) = self.node_positions.get(&conn.target) {
                            // Create propagated pulse config
                            let mut propagated_config = pulse.config.clone();
                            propagated_config.initial_intensity *= 
                                conn.strength * pulse.config.propagation_factor;
                            propagated_config.propagate = false; // Don't propagate further
                            
                            let target: String = conn.target.clone();
                            new_pulses.push((target, position, propagated_config));
                        }
                    }
                }
            }
        }
        
        // Emit new pulses
        for (node_id, position, config) in new_pulses {
            pulse_manager.emit_with_config(&node_id, position, config);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_pulse_creation() {
        let pulse = Pulse::new(
            0,
            "node_1".to_string(),
            Vec3::ZERO,
            PulseConfig::default(),
        );
        
        assert_eq!(pulse.id, 0);
        assert_eq!(pulse.radius, PulseConfig::default().initial_radius);
        assert!(!pulse.finished);
    }

    #[test]
    fn test_pulse_update() {
        let mut pulse = Pulse::new(
            0,
            "node_1".to_string(),
            Vec3::ZERO,
            PulseConfig::default(),
        );
        
        pulse.update(0.1);
        
        assert!(pulse.radius > PulseConfig::default().initial_radius);
        assert!(pulse.intensity < PulseConfig::default().initial_intensity);
    }

    #[test]
    fn test_pulse_finishes() {
        let mut pulse = Pulse::new(
            0,
            "node_1".to_string(),
            Vec3::ZERO,
            PulseConfig {
                decay_rate: 10.0, // Very fast decay
                ..Default::default()
            },
        );
        
        pulse.update(0.5); // Should decay to 0
        
        assert!(pulse.finished);
    }

    #[test]
    fn test_pulse_manager() {
        let mut manager = PulseManager::new();
        
        let id = manager.emit("node_1", Vec3::ZERO, PulseType::Selection);
        
        assert!(manager.get_pulse(id).is_some());
        assert_eq!(manager.count(), 1);
    }

    #[test]
    fn test_pulse_manager_cleanup() {
        let mut manager = PulseManager::new();
        manager.max_pulses = 2;
        
        manager.emit("node_1", Vec3::ZERO, PulseType::Selection);
        manager.emit("node_2", Vec3::ZERO, PulseType::Selection);
        manager.emit("node_3", Vec3::ZERO, PulseType::Selection);
        
        // Should not exceed max
        assert!(manager.count() <= manager.max_pulses);
    }

    #[test]
    fn test_pulse_types() {
        let manager = PulseManager::new();
        
        let selection_config = manager.get_config(PulseType::Selection);
        assert_eq!(selection_config.color, Vec4::new(1.0, 0.3, 0.5, 1.0));
        
        let error_config = manager.get_config(PulseType::Error);
        assert_eq!(error_config.color, Vec4::new(1.0, 0.0, 0.0, 1.0));
    }

    #[test]
    fn test_pulse_render_data() {
        let pulse = Pulse::new(
            0,
            "node_1".to_string(),
            Vec3::new(1.0, 2.0, 3.0),
            PulseConfig::default(),
        );
        
        let render_data = PulseRenderData::from(&pulse);
        
        assert_eq!(render_data.position, [1.0, 2.0, 3.0]);
        assert_eq!(render_data.radius, pulse.radius);
    }

    #[test]
    fn test_neural_topology() {
        let mut topology = NeuralTopology::new();
        
        topology.add_connection("node_1".to_string(), "node_2".to_string(), 0.8);
        topology.set_node_position("node_1".to_string(), Vec3::ZERO);
        topology.set_node_position("node_2".to_string(), Vec3::new(5.0, 0.0, 0.0));
        
        let connections = topology.get_connections("node_1").unwrap();
        assert_eq!(connections.len(), 1);
        assert_eq!(connections[0].target, "node_2");
        
        let pos = topology.get_position("node_2").unwrap();
        assert_eq!(pos, Vec3::new(5.0, 0.0, 0.0));
    }
}
