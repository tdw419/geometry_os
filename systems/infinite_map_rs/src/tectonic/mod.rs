//! Tectonic Realignment System for Phase 28
//!
//! Makes the Infinite Map morphologically reactive to cognitive load.
//! Districts that frequently exchange NeuralPulses become physically proximal,
//! reducing "Saccade distance" for Area Agents.

pub mod bonds;
pub mod simulator;
pub mod solver;
pub mod constraints;
pub mod ascii;

pub use bonds::{CognitiveBond, CognitiveBondGraph, BondType};
pub use simulator::{TectonicSimulator, PulseEvent, LayoutDelta};
pub use solver::ForceDirectedSolver;
pub use constraints::HilbertConstraint;
pub use ascii::TectonicAsciiRenderer;

use std::path::PathBuf;

/// Tile identifier in the Infinite Map
pub type TileId = u64;

/// 2D coordinate in the map
pub type Coord = (f64, f64);

/// Configuration for the TectonicSimulator
#[derive(Clone, Debug)]
pub struct TectonicConfig {
    /// Sliding window duration in seconds
    pub aggregation_window_secs: u64,

    /// Ideal spacing between tiles (in pixels)
    pub ideal_spacing: f64,

    /// Maximum movement per realignment cycle (in pixels)
    pub max_movement: f64,

    /// Minimum bond strength to consider for realignment
    pub min_bond_strength: f64,

    /// Hilbert constraint strength (0.0 = no constraint, 1.0 = full)
    pub hilbert_strength: f64,

    /// Output directory for ASCII files
    pub ascii_output_dir: PathBuf,
}

impl Default for TectonicConfig {
    fn default() -> Self {
        Self {
            aggregation_window_secs: 60,
            ideal_spacing: 512.0,
            max_movement: 256.0,
            min_bond_strength: 0.1,
            hilbert_strength: 0.5,
            ascii_output_dir: PathBuf::from(".geometry/ascii_scene"),
        }
    }
}
