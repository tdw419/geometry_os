//! Hilbert Curve Constraints for Tectonic Realignment.
//!
//! Preserves spatial locality while allowing tectonic movement.

use std::collections::HashMap;

use super::{TileId, Coord};

/// Hilbert curve constraint system
pub struct HilbertConstraint {
    /// Strength of the constraint (0.0 = no constraint, 1.0 = full)
    strength: f64,

    /// Order of the Hilbert curve (2^order tiles per side)
    order: u32,

    /// Pre-computed Hilbert curve positions
    curve_cache: HashMap<u64, Coord>,
}

impl HilbertConstraint {
    pub fn new(strength: f64) -> Self {
        Self {
            strength: strength.clamp(0.0, 1.0),
            order: 8, // 256x256 grid
            curve_cache: HashMap::new(),
        }
    }

    /// Constrain a proposed position to respect Hilbert ordering
    pub fn constrain(
        &self,
        tile: TileId,
        proposed: Coord,
        _all_positions: &HashMap<TileId, Coord>,
    ) -> Coord {
        if self.strength < 0.01 {
            return proposed; // No constraint
        }

        // Get the expected Hilbert position for this tile
        let expected = self.hilbert_position(tile);

        // Interpolate between proposed and expected based on strength
        let t = self.strength;
        (
            proposed.0 * (1.0 - t) + expected.0 * t,
            proposed.1 * (1.0 - t) + expected.1 * t,
        )
    }

    /// Calculate the Hilbert curve position for a given index
    fn hilbert_position(&self, index: TileId) -> Coord {
        // Use cache if available
        if let Some(&pos) = self.curve_cache.get(&index) {
            return pos;
        }

        // Calculate Hilbert position
        let (x, y) = Self::d2xy(self.order, index);

        // Scale to pixel coordinates (512px tiles)
        let px = (x as f64) * 512.0;
        let py = (y as f64) * 512.0;

        (px, py)
    }

    /// Convert Hilbert index to (x, y) coordinates
    /// From "Hacker's Delight" by Henry Warren
    fn d2xy(n: u32, d: TileId) -> (u32, u32) {
        let mut x: u32 = 0;
        let mut y: u32 = 0;
        let mut s: u32 = 1;
        let mut d = d; // Make mutable

        while s < (1u32 << n) {
            let rx = ((d >> 1) & 1) as u32;
            let ry = ((d ^ (rx as TileId)) & 1) as u32;

            let (nx, ny) = Self::rot(s, x, y, rx, ry);
            x = nx + s * rx;
            y = ny + s * ry;

            d >>= 2;
            s <<= 1;
        }

        (x, y)
    }

    /// Rotate/flip quadrant appropriately
    fn rot(n: u32, x: u32, y: u32, rx: u32, ry: u32) -> (u32, u32) {
        if ry == 0 {
            if rx == 1 {
                let x = n - 1 - x;
                let y = n - 1 - y;
                return (y, x);
            }
            return (y, x);
        }
        (x, y)
    }

    /// Calculate preservation score (how well current layout respects Hilbert)
    pub fn preservation_score(&self, positions: &HashMap<TileId, Coord>) -> f64 {
        if positions.is_empty() {
            return 1.0;
        }

        let mut total_deviation = 0.0;

        for (&tile, &actual) in positions {
            let expected = self.hilbert_position(tile);
            let deviation = ((actual.0 - expected.0).powi(2) +
                            (actual.1 - expected.1).powi(2)).sqrt();
            total_deviation += deviation;
        }

        let avg_deviation = total_deviation / positions.len() as f64;

        // Convert to score (0.0 = completely scrambled, 1.0 = perfect)
        // Assuming 512px tiles, max reasonable deviation is ~1024px
        let max_deviation = 1024.0;
        let score = 1.0 - (avg_deviation / max_deviation).min(1.0);

        score.max(0.0)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_hilbert_position() {
        let constraint = HilbertConstraint::new(1.0);

        // First few Hilbert positions should be deterministic
        let p0 = constraint.hilbert_position(0);
        let p1 = constraint.hilbert_position(1);
        let p2 = constraint.hilbert_position(2);

        // They should all be different
        assert!(p0 != p1);
        assert!(p1 != p2);
        assert!(p0 != p2);
    }

    #[test]
    fn test_constraint_no_strength() {
        let constraint = HilbertConstraint::new(0.0);
        let positions = HashMap::new();

        let proposed = (100.0, 200.0);
        let constrained = constraint.constrain(0, proposed, &positions);

        assert!((constrained.0 - proposed.0).abs() < 0.01);
        assert!((constrained.1 - proposed.1).abs() < 0.01);
    }

    #[test]
    fn test_constraint_full_strength() {
        let constraint = HilbertConstraint::new(1.0);
        let positions = HashMap::new();

        let proposed = (10000.0, 20000.0); // Way off
        let constrained = constraint.constrain(0, proposed, &positions);

        // Should be pulled toward Hilbert position
        let expected = constraint.hilbert_position(0);
        assert!((constrained.0 - expected.0).abs() < 0.01);
        assert!((constrained.1 - expected.1).abs() < 0.01);
    }

    #[test]
    fn test_preservation_score() {
        let constraint = HilbertConstraint::new(0.5);

        // Perfect layout
        let mut perfect = HashMap::new();
        for i in 0..10 {
            perfect.insert(i, constraint.hilbert_position(i));
        }
        let perfect_score = constraint.preservation_score(&perfect);
        assert!(perfect_score > 0.99);

        // Scrambled layout
        let mut scrambled = HashMap::new();
        for i in 0..10 {
            scrambled.insert(i, ((i * 1000) as f64, ((i * 2000) % 5000) as f64));
        }
        let scrambled_score = constraint.preservation_score(&scrambled);
        assert!(scrambled_score < perfect_score);
    }
}
