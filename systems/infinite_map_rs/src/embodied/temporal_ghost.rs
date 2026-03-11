//! Temporal Ghost Overlay - Previous states as faded overlays
//!
//! This module implements a temporal visualization system that shows previous
//! neural states as faded "ghosts" overlaid on the current state, allowing
//! users to understand the evolution of thought over time.

use glam::{Vec3, Vec4};
use std::collections::VecDeque;
use std::time::{Duration, Instant};

/// A snapshot of neural state at a point in time
#[derive(Debug, Clone)]
pub struct NeuralSnapshot {
    /// Unique identifier
    pub id: u64,
    /// Timestamp when snapshot was taken
    pub timestamp: Instant,
    /// Node positions (node_id -> position)
    pub node_positions: Vec<(String, Vec3)>,
    /// Node activations (node_id -> activation)
    pub node_activations: Vec<(String, f32)>,
    /// Node colors (node_id -> color)
    pub node_colors: Vec<(String, Vec4)>,
    /// Overall confidence at this time
    pub confidence: f32,
    /// Overall entropy at this time
    pub entropy: f32,
    /// Emotional state at this time
    pub emotional_state: String,
    /// Custom metadata
    pub metadata: Vec<(String, String)>,
}

impl NeuralSnapshot {
    /// Create a new snapshot
    pub fn new(id: u64) -> Self {
        Self {
            id,
            timestamp: Instant::now(),
            node_positions: Vec::new(),
            node_activations: Vec::new(),
            node_colors: Vec::new(),
            confidence: 0.0,
            entropy: 0.0,
            emotional_state: "Idle".to_string(),
            metadata: Vec::new(),
        }
    }

    /// Add a node to the snapshot
    pub fn add_node(&mut self, id: String, position: Vec3, activation: f32, color: Vec4) {
        self.node_positions.push((id.clone(), position));
        self.node_activations.push((id.clone(), activation));
        self.node_colors.push((id, color));
    }

    /// Get age of this snapshot
    pub fn age(&self) -> Duration {
        self.timestamp.elapsed()
    }

    /// Get node count
    pub fn node_count(&self) -> usize {
        self.node_positions.len()
    }
}

/// Configuration for temporal ghost system
#[derive(Debug, Clone)]
pub struct TemporalGhostConfig {
    /// Maximum number of snapshots to keep
    pub max_snapshots: usize,
    /// How long to keep snapshots before discarding
    pub max_age: Duration,
    /// Base alpha for the most recent ghost
    pub base_alpha: f32,
    /// Alpha decay factor per snapshot (0-1, lower = faster fade)
    pub alpha_decay: f32,
    /// Minimum alpha before ghost is invisible
    pub min_alpha: f32,
    /// Whether to interpolate between snapshots
    pub interpolate: bool,
    /// Interpolation smoothness (0-1, higher = smoother)
    pub interpolation_smoothness: f32,
    /// Whether to show ghost trails (motion blur)
    pub show_trails: bool,
    /// Trail length
    pub trail_length: usize,
    /// Whether to pulse ghosts at regular intervals
    pub pulse_ghosts: bool,
    /// Pulse interval
    pub pulse_interval: Duration,
}

impl Default for TemporalGhostConfig {
    fn default() -> Self {
        Self {
            max_snapshots: 20,
            max_age: Duration::from_secs(30),
            base_alpha: 0.4,
            alpha_decay: 0.7,
            min_alpha: 0.05,
            interpolate: true,
            interpolation_smoothness: 0.5,
            show_trails: true,
            trail_length: 5,
            pulse_ghosts: false,
            pulse_interval: Duration::from_secs(2),
        }
    }
}

/// A rendered ghost frame
#[derive(Debug, Clone)]
pub struct GhostFrame {
    /// Snapshot ID
    pub snapshot_id: u64,
    /// Age of this ghost
    pub age: Duration,
    /// Alpha for this ghost
    pub alpha: f32,
    /// Interpolated node positions
    pub positions: Vec<(String, Vec3)>,
    /// Interpolated node colors
    pub colors: Vec<(String, Vec4)>,
    /// Whether this ghost is currently pulsing
    pub pulsing: bool,
    /// Pulse phase (0-1)
    pub pulse_phase: f32,
}

/// Temporal ghost overlay manager
#[derive(Debug)]
pub struct TemporalGhostSystem {
    /// Snapshot history (ring buffer)
    snapshots: VecDeque<NeuralSnapshot>,
    /// Configuration
    pub config: TemporalGhostConfig,
    /// Next snapshot ID
    next_id: u64,
    /// Last snapshot time
    last_snapshot: Instant,
    /// Snapshot interval
    snapshot_interval: Duration,
    /// Rendered ghost frames (cached)
    ghost_frames: Vec<GhostFrame>,
    /// Last update time
    last_update: Instant,
    /// Total snapshots captured
    total_captured: u64,
}

impl Default for TemporalGhostSystem {
    fn default() -> Self {
        Self::new(TemporalGhostConfig::default())
    }
}

impl TemporalGhostSystem {
    /// Create a new temporal ghost system
    pub fn new(config: TemporalGhostConfig) -> Self {
        Self {
            snapshots: VecDeque::with_capacity(config.max_snapshots),
            config,
            next_id: 0,
            last_snapshot: Instant::now(),
            snapshot_interval: Duration::from_millis(100), // 10 FPS
            ghost_frames: Vec::new(),
            last_update: Instant::now(),
            total_captured: 0,
        }
    }

    /// Capture a new snapshot
    pub fn capture(&mut self, snapshot: &mut NeuralSnapshot) {
        // Set ID and timestamp
        snapshot.id = self.next_id;
        self.next_id += 1;
        snapshot.timestamp = Instant::now();
        
        // Add to history
        if self.snapshots.len() >= self.config.max_snapshots {
            self.snapshots.pop_front();
        }
        self.snapshots.push_back(snapshot.clone());
        
        self.last_snapshot = Instant::now();
        self.total_captured += 1;
    }

    /// Capture if interval has passed
    pub fn capture_if_ready(&mut self, snapshot: &mut NeuralSnapshot) -> bool {
        if self.last_snapshot.elapsed() >= self.snapshot_interval {
            self.capture(snapshot);
            true
        } else {
            false
        }
    }

    /// Set snapshot interval
    pub fn set_snapshot_interval(&mut self, interval: Duration) {
        self.snapshot_interval = interval;
    }

    /// Update ghost system (call every frame)
    pub fn update(&mut self) {
        let now = Instant::now();
        let _dt = now.duration_since(self.last_update).as_secs_f32();
        self.last_update = now;

        // Remove old snapshots
        self.cleanup_old_snapshots();

        // Rebuild ghost frames
        self.rebuild_ghost_frames();
    }

    /// Remove snapshots older than max_age
    fn cleanup_old_snapshots(&mut self) {
        while let Some(front) = self.snapshots.front() {
            if front.age() > self.config.max_age {
                self.snapshots.pop_front();
            } else {
                break;
            }
        }
    }

    /// Rebuild ghost frames from snapshots
    fn rebuild_ghost_frames(&mut self) {
        self.ghost_frames.clear();
        
        let snapshots: Vec<_> = self.snapshots.iter().collect();
        let count = snapshots.len();
        
        for (i, snapshot) in snapshots.iter().enumerate() {
            // Calculate alpha based on position in history
            let recency = (count - i) as f32 / count.max(1) as f32;
            let alpha = self.config.base_alpha 
                * recency.powf(1.0 / self.config.alpha_decay)
                .max(self.config.min_alpha);
            
            // Skip if alpha is too low
            if alpha < self.config.min_alpha {
                continue;
            }

            // Calculate pulse phase if enabled
            let (pulsing, pulse_phase) = if self.config.pulse_ghosts {
                let elapsed = snapshot.age().as_secs_f32();
                let cycle = elapsed / self.config.pulse_interval.as_secs_f32();
                let phase = (cycle % 1.0) * std::f32::consts::TAU;
                let pulse = (phase.sin() + 1.0) / 2.0; // 0-1
                (true, pulse)
            } else {
                (false, 0.0)
            };
            
            // Create ghost frame
            let frame = GhostFrame {
                snapshot_id: snapshot.id,
                age: snapshot.age(),
                alpha,
                positions: snapshot.node_positions.clone(),
                colors: snapshot.node_colors.clone(),
                pulsing,
                pulse_phase,
            };
            
            self.ghost_frames.push(frame);
        }
    }

    /// Get all ghost frames for rendering
    pub fn get_ghost_frames(&self) -> &[GhostFrame] {
        &self.ghost_frames
    }

    /// Get interpolated position for a node across all ghosts
    pub fn get_node_trail(&self, node_id: &str) -> Vec<Vec3> {
        let mut trail = Vec::new();
        
        for frame in &self.ghost_frames {
            if let Some((_, pos)) = frame.positions.iter().find(|(id, _)| id == node_id) {
                trail.push(*pos);
            }
        }
        
        // Limit trail length
        if trail.len() > self.config.trail_length {
            trail.drain(0..trail.len() - self.config.trail_length);
        }
        
        trail
    }

    /// Get snapshot count
    pub fn snapshot_count(&self) -> usize {
        self.snapshots.len()
    }

    /// Get total snapshots captured
    pub fn total_captured(&self) -> u64 {
        self.total_captured
    }

    /// Clear all snapshots
    pub fn clear(&mut self) {
        self.snapshots.clear();
        self.ghost_frames.clear();
    }

    /// Get the most recent snapshot
    pub fn get_latest_snapshot(&self) -> Option<&NeuralSnapshot> {
        self.snapshots.back()
    }

    /// Get a specific snapshot by ID
    pub fn get_snapshot(&self, id: u64) -> Option<&NeuralSnapshot> {
        self.snapshots.iter().find(|s| s.id == id)
    }

    /// Get snapshots within a time range
    pub fn get_snapshots_in_range(&self, start: Duration, end: Duration) -> Vec<&NeuralSnapshot> {
        self.snapshots
            .iter()
            .filter(|s| {
                let age = s.age();
                age >= start && age <= end
            })
            .collect()
    }

    /// Calculate average confidence over time
    pub fn get_average_confidence(&self, duration: Duration) -> f32 {
        let cutoff = Instant::now() - duration;
        let relevant: Vec<_> = self.snapshots
            .iter()
            .filter(|s| s.timestamp >= cutoff)
            .collect();
        
        if relevant.is_empty() {
            return 0.0;
        }
        
        relevant.iter().map(|s| s.confidence).sum::<f32>() / relevant.len() as f32
    }

    /// Calculate confidence trend (positive = improving, negative = declining)
    pub fn get_confidence_trend(&self) -> f32 {
        let snapshots: Vec<_> = self.snapshots.iter().collect();
        
        if snapshots.len() < 2 {
            return 0.0;
        }
        
        // Compare first half to second half
        let mid = snapshots.len() / 2;
        let first_half_avg: f32 = snapshots[..mid].iter().map(|s| s.confidence).sum::<f32>() / mid.max(1) as f32;
        let second_half_avg: f32 = snapshots[mid..].iter().map(|s| s.confidence).sum::<f32>() / (snapshots.len() - mid).max(1) as f32;
        
        second_half_avg - first_half_avg
    }

    /// Find significant events (large confidence/entropy changes)
    pub fn find_significant_events(&self, threshold: f32) -> Vec<u64> {
        let mut event_ids = Vec::new();
        let snapshots: Vec<_> = self.snapshots.iter().collect();
        
        for i in 1..snapshots.len() {
            let prev = &snapshots[i - 1];
            let curr = &snapshots[i];
            
            let confidence_delta = (curr.confidence - prev.confidence).abs();
            let entropy_delta = (curr.entropy - prev.entropy).abs();
            
            if confidence_delta > threshold || entropy_delta > threshold {
                event_ids.push(curr.id);
            }
        }
        
        event_ids
    }
}

/// Ghost comparison mode for visualizing differences
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum GhostComparisonMode {
    /// Show all ghosts overlaid
    Overlay,
    /// Show difference from current state
    Difference,
    /// Show only changed nodes
    ChangesOnly,
    /// Show motion trails
    MotionTrails,
}

/// Ghost visualizer for rendering
pub struct GhostVisualizer {
    /// Comparison mode
    pub mode: GhostComparisonMode,
    /// Highlight color for differences
    pub diff_highlight_color: Vec4,
    /// Threshold for showing differences
    pub diff_threshold: f32,
}

impl Default for GhostVisualizer {
    fn default() -> Self {
        Self {
            mode: GhostComparisonMode::Overlay,
            diff_highlight_color: Vec4::new(1.0, 0.5, 0.0, 0.8), // Orange
            diff_threshold: 0.1,
        }
    }
}

impl GhostVisualizer {
    /// Create a new visualizer
    pub fn new() -> Self {
        Self::default()
    }

    /// Calculate difference between two snapshots
    pub fn calculate_diff(&self, a: &NeuralSnapshot, b: &NeuralSnapshot) -> Vec<(String, f32)> {
        let mut diffs = Vec::new();
        
        for (id, act_a) in &a.node_activations {
            if let Some((_, act_b)) = b.node_activations.iter().find(|(id_b, _)| id_b == id) {
                let diff = (act_a - act_b).abs();
                if diff > self.diff_threshold {
                    diffs.push((id.clone(), diff));
                }
            }
        }
        
        diffs
    }

    /// Get visual data for a ghost frame in difference mode
    pub fn get_diff_visual(&self, ghost: &GhostFrame, current: &NeuralSnapshot) -> Vec<(String, Vec3, Vec4)> {
        let mut visuals = Vec::new();
        
        for (id, pos) in &ghost.positions {
            // Get current activation
            if let Some((_, curr_act)) = current.node_activations.iter().find(|(cid, _)| cid == id) {
                // Get ghost color (alpha stores activation)
                if let Some((_, ghost_color)) = ghost.colors.iter().find(|(cid, _)| cid == id) {
                    // Use difference color if significant change
                    let curr_act_val = *curr_act;
                    let ghost_act_val = ghost_color.w; // Alpha stores activation
                    if (curr_act_val - ghost_act_val).abs() > self.diff_threshold {
                        let color = self.diff_highlight_color;
                        visuals.push((id.clone(), *pos, color));
                    }
                }
            }
        }
        
        visuals
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_snapshot_creation() {
        let mut snapshot = NeuralSnapshot::new(0);
        snapshot.add_node("node_1".to_string(), Vec3::ZERO, 0.5, Vec4::ONE);
        
        assert_eq!(snapshot.node_count(), 1);
        assert_eq!(snapshot.id, 0);
    }

    #[test]
    fn test_temporal_ghost_system() {
        let mut system = TemporalGhostSystem::new(TemporalGhostConfig {
            max_snapshots: 5,
            ..Default::default()
        });
        
        // Capture some snapshots
        for i in 0..10 {
            let mut snapshot = NeuralSnapshot::new(i);
            snapshot.add_node(
                format!("node_{}", i),
                Vec3::new(i as f32, 0.0, 0.0),
                0.5,
                Vec4::ONE,
            );
            system.capture(&mut snapshot);
        }
        
        // Should only keep max_snapshots
        assert_eq!(system.snapshot_count(), 5);
    }

    #[test]
    fn test_ghost_alpha_decay() {
        let mut system = TemporalGhostSystem::new(TemporalGhostConfig {
            max_snapshots: 3,
            base_alpha: 0.5,
            alpha_decay: 0.5,
            min_alpha: 0.1,
            ..Default::default()
        });
        
        // Capture 3 snapshots
        for i in 0..3 {
            let mut snapshot = NeuralSnapshot::new(i);
            snapshot.add_node(format!("node_{}", i), Vec3::ZERO, 0.5, Vec4::ONE);
            system.capture(&mut snapshot);
        }
        
        system.update();
        
        // Should have 3 ghost frames with decreasing alpha
        let frames = system.get_ghost_frames();
        assert_eq!(frames.len(), 3);
        
        // First frame should have lowest alpha
        // Last frame should have highest alpha
        if frames.len() >= 2 {
            assert!(frames[0].alpha <= frames[frames.len() - 1].alpha);
        }
    }

    #[test]
    fn test_node_trail() {
        let mut system = TemporalGhostSystem::new(TemporalGhostConfig {
            max_snapshots: 5,
            trail_length: 3,
            show_trails: true,
            ..Default::default()
        });
        
        // Capture snapshots with moving node
        for i in 0..5 {
            let mut snapshot = NeuralSnapshot::new(i);
            snapshot.add_node(
                "node_1".to_string(),
                Vec3::new(i as f32, 0.0, 0.0),
                0.5,
                Vec4::ONE,
            );
            system.capture(&mut snapshot);
        }
        
        system.update();
        
        let trail = system.get_node_trail("node_1");
        assert!(trail.len() <= 3); // Limited by trail_length
    }

    #[test]
    fn test_confidence_trend() {
        let mut system = TemporalGhostSystem::default();
        
        // Capture snapshots with improving confidence
        for i in 0..5 {
            let mut snapshot = NeuralSnapshot::new(i);
            snapshot.confidence = 0.2 + (i as f32 * 0.15); // 0.2 -> 0.8
            system.capture(&mut snapshot);
        }
        
        let trend = system.get_confidence_trend();
        assert!(trend > 0.0); // Positive trend
    }

    #[test]
    fn test_significant_events() {
        let mut system = TemporalGhostSystem::default();
        
        // Capture snapshots with one significant change
        let mut snapshot = NeuralSnapshot::new(0);
        snapshot.confidence = 0.5;
        system.capture(&mut snapshot);
        
        let mut snapshot = NeuralSnapshot::new(1);
        snapshot.confidence = 0.8; // Big jump
        system.capture(&mut snapshot);
        
        let event_ids = system.find_significant_events(0.2);
        assert!(!event_ids.is_empty());
    }

    #[test]
    fn test_ghost_visualizer_diff() {
        let visualizer = GhostVisualizer::new();
        
        let mut a = NeuralSnapshot::new(0);
        a.add_node("node_1".to_string(), Vec3::ZERO, 0.5, Vec4::ONE);
        
        let mut b = NeuralSnapshot::new(1);
        b.add_node("node_1".to_string(), Vec3::ZERO, 0.9, Vec4::ONE); // Different activation
        
        let diffs = visualizer.calculate_diff(&a, &b);
        assert!(!diffs.is_empty());
    }
}
