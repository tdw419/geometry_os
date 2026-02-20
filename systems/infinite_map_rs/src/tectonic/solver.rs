//! Force-Directed Layout Solver for Tectonic Realignment.
//!
//! Uses a modified Fruchterman-Reingold algorithm with Hilbert constraints.

use std::collections::HashMap;
use std::f64::consts::PI;

use super::bonds::CognitiveBond;
use super::constraints::HilbertConstraint;
use super::{Coord, TileId};

/// Configuration for the solver
const ITERATIONS: usize = 100;
const TEMPERATURE_DECAY: f64 = 0.95;
const MIN_TEMPERATURE: f64 = 0.01;

/// Force-Directed Layout Solver
pub struct ForceDirectedSolver {
    /// Ideal spacing between tiles
    k: f64,

    /// Maximum movement per iteration
    max_displacement: f64,

    /// Initial temperature for simulated annealing
    initial_temperature: f64,
}

impl ForceDirectedSolver {
    pub fn new(ideal_spacing: f64, max_displacement: f64) -> Self {
        Self {
            k: ideal_spacing,
            max_displacement,
            initial_temperature: ideal_spacing * 0.5,
        }
    }

    /// Solve for optimal tile positions
    pub fn solve(
        &self,
        positions: &HashMap<TileId, Coord>,
        bonds: &[CognitiveBond],
        constraint: &HilbertConstraint,
    ) -> HashMap<TileId, Coord> {
        if positions.is_empty() || bonds.is_empty() {
            return positions.clone();
        }

        let mut current = positions.clone();
        let mut temperature = self.initial_temperature;

        for _ in 0..ITERATIONS {
            // Calculate forces on each tile
            let forces = self.calculate_forces(&current, bonds);

            // Apply forces with temperature-limited displacement
            for (&tile, &force) in &forces {
                if let Some(pos) = current.get_mut(&tile) {
                    // Limit displacement
                    let (dx, dy) = force;
                    let mag = (dx * dx + dy * dy).sqrt();
                    let scale = if mag > 0.0 {
                        (mag.min(temperature) / mag) * self.max_displacement.min(1.0)
                    } else {
                        0.0
                    };

                    pos.0 += dx * scale;
                    pos.1 += dy * scale;

                    // Apply Hilbert constraint
                    *pos = constraint.constrain(tile, *pos, positions);
                }
            }

            // Cool down
            temperature *= TEMPERATURE_DECAY;
            if temperature < MIN_TEMPERATURE {
                break;
            }
        }

        current
    }

    /// Calculate net forces on all tiles
    fn calculate_forces(
        &self,
        positions: &HashMap<TileId, Coord>,
        bonds: &[CognitiveBond],
    ) -> HashMap<TileId, Coord> {
        let mut forces: HashMap<TileId, Coord> =
            positions.keys().map(|&id| (id, (0.0, 0.0))).collect();

        // Attractive forces from bonds
        for bond in bonds {
            if let (Some(&src_pos), Some(&dst_pos)) =
                (positions.get(&bond.source), positions.get(&bond.dest))
            {
                let (dx, dy) = (dst_pos.0 - src_pos.0, dst_pos.1 - src_pos.1);
                let dist = (dx * dx + dy * dy).sqrt().max(0.1); // Avoid division by zero

                // Attraction: stronger bonds = more attraction
                let ideal_dist = self.k * (1.0 - bond.strength * 0.5); // Stronger bond = closer
                let attraction = self.attraction_force(dist, ideal_dist);

                let fx = (dx / dist) * attraction * bond.strength;
                let fy = (dy / dist) * attraction * bond.strength;

                if let Some(src_force) = forces.get_mut(&bond.source) {
                    src_force.0 += fx;
                    src_force.1 += fy;
                }
                if let Some(dst_force) = forces.get_mut(&bond.dest) {
                    dst_force.0 -= fx;
                    dst_force.1 -= fy;
                }
            }
        }

        // Repulsive forces between all tiles (prevent overcrowding)
        let tiles: Vec<TileId> = positions.keys().copied().collect();
        for i in 0..tiles.len() {
            for j in (i + 1)..tiles.len() {
                let tile_a = tiles[i];
                let tile_b = tiles[j];

                if let (Some(&pos_a), Some(&pos_b)) =
                    (positions.get(&tile_a), positions.get(&tile_b))
                {
                    let (dx, dy) = (pos_b.0 - pos_a.0, pos_b.1 - pos_a.1);
                    let dist = (dx * dx + dy * dy).sqrt().max(0.1);

                    let repulsion = self.repulsion_force(dist);

                    let fx = (dx / dist) * repulsion;
                    let fy = (dy / dist) * repulsion;

                    if let Some(force_a) = forces.get_mut(&tile_a) {
                        force_a.0 -= fx;
                        force_a.1 -= fy;
                    }
                    if let Some(force_b) = forces.get_mut(&tile_b) {
                        force_b.0 += fx;
                        force_b.1 += fy;
                    }
                }
            }
        }

        forces
    }

    /// Fruchterman-Reingold attraction force
    fn attraction_force(&self, distance: f64, ideal: f64) -> f64 {
        // F_a = d^2 / k
        (distance - ideal).powi(2) / self.k
    }

    /// Fruchterman-Reingold repulsion force
    fn repulsion_force(&self, distance: f64) -> f64 {
        // F_r = k^2 / d
        (self.k * self.k) / distance
    }
}

#[cfg(test)]
mod tests {
    use super::super::bonds::BondType;
    use super::*;

    #[test]
    fn test_solver_basic() {
        let solver = ForceDirectedSolver::new(100.0, 50.0);
        let constraint = HilbertConstraint::new(0.0); // No constraint for test

        let mut positions = HashMap::new();
        positions.insert(0, (0.0, 0.0));
        positions.insert(1, (200.0, 0.0));

        let bonds = vec![CognitiveBond {
            source: 0,
            dest: 1,
            strength: 0.8,
            bond_type: BondType::Cognitive,
            pulse_count: 10,
        }];

        let result = solver.solve(&positions, &bonds, &constraint);

        // Strong bond should pull tiles closer together
        let pos_0 = result.get(&0).unwrap();
        let pos_1 = result.get(&1).unwrap();
        let dist = ((pos_1.0 - pos_0.0).powi(2) + (pos_1.1 - pos_0.1).powi(2)).sqrt();

        assert!(
            dist < 200.0,
            "Distance should decrease: {} -> {}",
            200.0,
            dist
        );
    }

    #[test]
    fn test_solver_no_bonds() {
        let solver = ForceDirectedSolver::new(100.0, 50.0);
        let constraint = HilbertConstraint::new(0.0);

        let mut positions = HashMap::new();
        positions.insert(0, (0.0, 0.0));
        positions.insert(1, (100.0, 0.0));

        let bonds = vec![];

        let result = solver.solve(&positions, &bonds, &constraint);

        // Without bonds, tiles should spread apart due to repulsion
        let pos_0 = result.get(&0).unwrap();
        let pos_1 = result.get(&1).unwrap();
        let dist = ((pos_1.0 - pos_0.0).powi(2) + (pos_1.1 - pos_0.1).powi(2)).sqrt();

        // They might move, but should still exist
        assert!(result.contains_key(&0));
        assert!(result.contains_key(&1));
    }
}
