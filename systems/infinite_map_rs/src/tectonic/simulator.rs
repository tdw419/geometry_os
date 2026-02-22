//! Main TectonicSimulator for Phase 28 Tectonic Realignment.

use serde::{Deserialize, Serialize};
use std::collections::{HashMap, VecDeque};
use std::path::PathBuf;
use std::time::{Duration, Instant, SystemTime, UNIX_EPOCH};

use super::ascii::TectonicAsciiRenderer;
use super::bonds::{BondType, CognitiveBond, CognitiveBondGraph};
use super::constraints::HilbertConstraint;
use super::solver::ForceDirectedSolver;
use super::{Coord, TectonicConfig, TileId};

/// A pulse event from the NeuralPulseSystem
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct PulseEvent {
    pub source: TileId,
    pub dest: TileId,
    /// Pulse type: 'violet' (cognitive) or 'cyan' (semantic)
    pub pulse_type: String,
    /// Volume/intensity of the pulse
    pub volume: f64,
    /// Timestamp in milliseconds since epoch
    pub timestamp: u64,
}

/// A proposed tile movement
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct TileMovement {
    pub tile_id: TileId,
    pub from: Coord,
    pub to: Coord,
    /// Distance moved in pixels
    pub delta: f64,
    /// Estimated saccade gain percentage
    pub saccade_gain: f64,
}

/// Result of a layout optimization
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct LayoutDelta {
    pub movements: Vec<TileMovement>,
    pub timestamp: u64,
    /// Total saccade distance before optimization
    pub before_saccade: f64,
    /// Total saccade distance after optimization
    pub after_saccade: f64,
    /// Improvement percentage
    pub improvement_pct: f64,
}

/// Sliding window for pulse aggregation
pub struct SlidingWindow<T> {
    data: VecDeque<T>,
    duration: Duration,
    get_timestamp: fn(&T) -> u64,
}

impl<T: Clone> SlidingWindow<T> {
    pub fn new(duration: Duration, get_timestamp: fn(&T) -> u64) -> Self {
        Self {
            data: VecDeque::new(),
            duration,
            get_timestamp,
        }
    }

    pub fn push(&mut self, item: T) {
        self.data.push_back(item);
        self.evict_expired();
    }

    fn evict_expired(&mut self) {
        let now = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap()
            .as_millis() as u64;

        let cutoff = now.saturating_sub(self.duration.as_millis() as u64);
        let get_ts = self.get_timestamp;

        while let Some(front) = self.data.front() {
            if get_ts(front) < cutoff {
                self.data.pop_front();
            } else {
                break;
            }
        }
    }

    pub fn iter(&self) -> impl Iterator<Item = &T> {
        self.data.iter()
    }

    pub fn len(&self) -> usize {
        self.data.len()
    }

    pub fn is_empty(&self) -> bool {
        self.data.is_empty()
    }
}

/// Main Tectonic Simulator
pub struct TectonicSimulator {
    config: TectonicConfig,

    /// Sliding window for pulse events
    pulse_window: SlidingWindow<PulseEvent>,

    /// Aggregated bond graph
    bond_graph: CognitiveBondGraph,

    /// Current tile positions
    tile_positions: HashMap<TileId, Coord>,

    /// Force-directed solver
    solver: ForceDirectedSolver,

    /// Hilbert constraint system
    hilbert_constraint: HilbertConstraint,

    /// ASCII renderer for observability
    ascii_renderer: TectonicAsciiRenderer,

    /// Last realignment timestamp
    last_realignment: Option<Instant>,

    /// Number of realignment cycles completed
    cycle_count: u64,
}

impl TectonicSimulator {
    pub fn new(config: TectonicConfig) -> Self {
        let window_duration = Duration::from_secs(config.aggregation_window_secs);

        Self {
            pulse_window: SlidingWindow::new(window_duration, |e| e.timestamp),
            bond_graph: CognitiveBondGraph::new(),
            tile_positions: HashMap::new(),
            solver: ForceDirectedSolver::new(config.ideal_spacing, config.max_movement),
            hilbert_constraint: HilbertConstraint::new(config.hilbert_strength),
            ascii_renderer: TectonicAsciiRenderer::new(config.ascii_output_dir.clone()),
            last_realignment: None,
            cycle_count: 0,
            config,
        }
    }

    /// Record a pulse event from NeuralPulseSystem
    pub fn record_pulse(&mut self, pulse: PulseEvent) {
        // Add to sliding window
        self.pulse_window.push(pulse.clone());

        // Add to bond graph
        let is_cognitive = pulse.pulse_type == "violet";
        self.bond_graph
            .add_pulse(pulse.source, pulse.dest, pulse.volume, is_cognitive);
    }

    /// Set the current position of a tile
    pub fn set_tile_position(&mut self, tile: TileId, pos: Coord) {
        self.tile_positions.insert(tile, pos);
    }

    /// Aggregate pulses into cognitive bonds
    pub fn aggregate_bonds(&self) -> Vec<CognitiveBond> {
        self.bond_graph.get_bonds(self.config.min_bond_strength)
    }

    /// Calculate optimal tile positions using force-directed layout
    pub fn solve_layout(&self) -> LayoutDelta {
        let bonds = self.aggregate_bonds();

        // Calculate current saccade distance
        let before_saccade = self.calculate_saccade_distance(&bonds);

        // Run force-directed solver
        let proposed_positions =
            self.solver
                .solve(&self.tile_positions, &bonds, &self.hilbert_constraint);

        // Apply constraints and calculate movements
        let mut movements = Vec::new();
        for (tile_id, new_pos) in &proposed_positions {
            if let Some(&old_pos) = self.tile_positions.get(tile_id) {
                let delta =
                    ((new_pos.0 - old_pos.0).powi(2) + (new_pos.1 - old_pos.1).powi(2)).sqrt();

                // Only include meaningful movements
                if delta > 1.0 {
                    let saccade_gain =
                        self.estimate_saccade_gain(*tile_id, &bonds, old_pos, *new_pos);
                    movements.push(TileMovement {
                        tile_id: *tile_id,
                        from: old_pos,
                        to: *new_pos,
                        delta,
                        saccade_gain,
                    });
                }
            }
        }

        // Calculate new saccade distance
        let after_saccade = if !movements.is_empty() {
            let mut new_positions = self.tile_positions.clone();
            for m in &movements {
                new_positions.insert(m.tile_id, m.to);
            }
            self.calculate_saccade_distance_with_positions(&bonds, &new_positions)
        } else {
            before_saccade
        };

        let improvement_pct = if before_saccade > 0.0 {
            ((before_saccade - after_saccade) / before_saccade) * 100.0
        } else {
            0.0
        };

        LayoutDelta {
            movements,
            timestamp: SystemTime::now()
                .duration_since(UNIX_EPOCH)
                .unwrap()
                .as_millis() as u64,
            before_saccade,
            after_saccade,
            improvement_pct,
        }
    }

    /// Calculate total saccade distance for current layout
    fn calculate_saccade_distance(&self, bonds: &[CognitiveBond]) -> f64 {
        self.calculate_saccade_distance_with_positions(bonds, &self.tile_positions)
    }

    fn calculate_saccade_distance_with_positions(
        &self,
        bonds: &[CognitiveBond],
        positions: &HashMap<TileId, Coord>,
    ) -> f64 {
        bonds
            .iter()
            .filter_map(|b| {
                let src_pos = positions.get(&b.source)?;
                let dst_pos = positions.get(&b.dest)?;
                let dist =
                    ((dst_pos.0 - src_pos.0).powi(2) + (dst_pos.1 - src_pos.1).powi(2)).sqrt();
                Some(dist * b.strength) // Weight by bond strength
            })
            .sum()
    }

    /// Estimate saccade gain from moving a tile
    fn estimate_saccade_gain(
        &self,
        tile: TileId,
        bonds: &[CognitiveBond],
        old_pos: Coord,
        new_pos: Coord,
    ) -> f64 {
        let mut old_dist = 0.0;
        let mut new_dist = 0.0;

        for bond in bonds {
            let other = if bond.source == tile {
                bond.dest
            } else if bond.dest == tile {
                bond.source
            } else {
                continue;
            };

            if let Some(&other_pos) = self.tile_positions.get(&other) {
                old_dist += ((other_pos.0 - old_pos.0).powi(2) + (other_pos.1 - old_pos.1).powi(2))
                    .sqrt()
                    * bond.strength;
                new_dist += ((other_pos.0 - new_pos.0).powi(2) + (other_pos.1 - new_pos.1).powi(2))
                    .sqrt()
                    * bond.strength;
            }
        }

        if old_dist > 0.0 {
            ((old_dist - new_dist) / old_dist) * 100.0
        } else {
            0.0
        }
    }

    /// Execute a realignment (apply the layout delta)
    pub fn execute_realignment(&mut self, delta: LayoutDelta) -> Result<(), String> {
        // Apply movements
        for movement in &delta.movements {
            self.tile_positions.insert(movement.tile_id, movement.to);
        }

        // Update cycle count
        self.cycle_count += 1;
        self.last_realignment = Some(Instant::now());

        // Clear bond graph for next window
        self.bond_graph.clear();

        // Emit ASCII
        self.ascii_renderer.emit(&self.get_state(&delta))?;

        Ok(())
    }

    /// Get current simulator state for ASCII output
    fn get_state(&self, delta: &LayoutDelta) -> TectonicState {
        TectonicState {
            cycle: self.cycle_count,
            top_bonds: self.bond_graph.get_top_bonds(10),
            pending_movements: delta.movements.clone(),
            stats: self.bond_graph.stats(),
            layout_delta: delta.clone(),
            hilbert_preservation: self
                .hilbert_constraint
                .preservation_score(&self.tile_positions),
        }
    }

    /// Check if it's time for a realignment
    pub fn should_realign(&self) -> bool {
        match self.last_realignment {
            None => true,
            Some(last) => {
                last.elapsed() >= Duration::from_secs(self.config.aggregation_window_secs)
            }
        }
    }

    /// Get the number of recorded pulses
    pub fn pulse_count(&self) -> usize {
        self.pulse_window.len()
    }

    /// Get the cycle count
    pub fn cycle_count(&self) -> u64 {
        self.cycle_count
    }
}

/// State snapshot for ASCII rendering
#[derive(Clone, Debug, Serialize)]
pub struct TectonicState {
    pub cycle: u64,
    pub top_bonds: Vec<CognitiveBond>,
    pub pending_movements: Vec<TileMovement>,
    pub stats: super::bonds::BondGraphStats,
    pub layout_delta: LayoutDelta,
    pub hilbert_preservation: f64,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_pulse_recording() {
        let config = TectonicConfig::default();
        let mut sim = TectonicSimulator::new(config);

        // Set some tile positions
        sim.set_tile_position(0, (0.0, 0.0));
        sim.set_tile_position(1, (512.0, 0.0));
        sim.set_tile_position(2, (1024.0, 0.0));

        // Record pulses
        sim.record_pulse(PulseEvent {
            source: 0,
            dest: 1,
            pulse_type: "violet".to_string(),
            volume: 10.0,
            timestamp: SystemTime::now()
                .duration_since(UNIX_EPOCH)
                .unwrap()
                .as_millis() as u64,
        });

        assert_eq!(sim.pulse_count(), 1);

        let bonds = sim.aggregate_bonds();
        assert_eq!(bonds.len(), 1);
        assert_eq!(bonds[0].bond_type, BondType::Cognitive);
    }

    #[test]
    fn test_saccade_calculation() {
        let config = TectonicConfig::default();
        let mut sim = TectonicSimulator::new(config);

        sim.set_tile_position(0, (0.0, 0.0));
        sim.set_tile_position(1, (100.0, 0.0));

        let bonds = vec![CognitiveBond {
            source: 0,
            dest: 1,
            strength: 1.0,
            bond_type: BondType::Cognitive,
            pulse_count: 1,
        }];

        let saccade = sim.calculate_saccade_distance(&bonds);
        assert!((saccade - 100.0).abs() < 0.1);
    }
}
