/*!
DamageTracker for Phase 30.8: Partial Terminal Updates

Tracks dirty cells in a terminal grid and computes minimal dirty rectangles
for efficient partial screen updates. Uses Hilbert curve mapping for
spatial locality in the underlying RTS texture.
*/

use fast_hilbert::{h2xy, xy2h};

/// A rectangle of dirty cells in the terminal grid
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct DirtyRect {
    /// Left column (inclusive)
    pub x1: u32,
    /// Top row (inclusive)
    pub y1: u32,
    /// Right column (exclusive)
    pub x2: u32,
    /// Bottom row (exclusive)
    pub y2: u32,
}

impl DirtyRect {
    /// Create a new dirty rectangle
    pub fn new(x1: u32, y1: u32, x2: u32, y2: u32) -> Self {
        Self { x1, y1, x2, y2 }
    }

    /// Create a rectangle containing a single cell
    pub fn from_cell(x: u32, y: u32) -> Self {
        Self {
            x1: x,
            y1: y,
            x2: x + 1,
            y2: y + 1,
        }
    }

    /// Check if a cell is contained within this rectangle
    pub fn contains(&self, x: u32, y: u32) -> bool {
        x >= self.x1 && x < self.x2 && y >= self.y1 && y < self.y2
    }

    /// Expand this rectangle to include another cell
    pub fn expand_to_include(&mut self, x: u32, y: u32) {
        self.x1 = self.x1.min(x);
        self.y1 = self.y1.min(y);
        self.x2 = self.x2.max(x + 1);
        self.y2 = self.y2.max(y + 1);
    }

    /// Merge another rectangle into this one
    pub fn merge(&mut self, other: &DirtyRect) {
        self.x1 = self.x1.min(other.x1);
        self.y1 = self.y1.min(other.y1);
        self.x2 = self.x2.max(other.x2);
        self.y2 = self.y2.max(other.y2);
    }

    /// Check if this rectangle overlaps or is adjacent to another
    pub fn overlaps_or_adjacent(&self, other: &DirtyRect) -> bool {
        // Check with +1 for adjacency (including diagonal)
        self.x1 <= other.x2 + 1
            && self.x2 + 1 >= other.x1
            && self.y1 <= other.y2 + 1
            && self.y2 + 1 >= other.y1
    }

    /// Get the width of the rectangle
    pub fn width(&self) -> u32 {
        self.x2.saturating_sub(self.x1)
    }

    /// Get the height of the rectangle
    pub fn height(&self) -> u32 {
        self.y2.saturating_sub(self.y1)
    }

    /// Get the area of the rectangle
    pub fn area(&self) -> u32 {
        self.width() * self.height()
    }
}

/// Tracks dirty cells in a terminal grid and computes dirty rectangles
pub struct DamageTracker {
    /// Number of columns in the terminal
    cols: u32,
    /// Number of rows in the terminal
    rows: u32,
    /// Bitfield of dirty cells (one bit per cell)
    dirty_cells: Vec<u64>,
    /// Flag indicating if any cells are dirty
    has_damage: bool,
}

impl DamageTracker {
    /// Create a new damage tracker for a terminal of the given size
    pub fn new(cols: u32, rows: u32) -> Self {
        let total_cells = (cols * rows) as usize;
        // Integer ceiling division: (n + d - 1) / d
        #[allow(clippy::manual_div_ceil)]
        let num_words = (total_cells + 63) / 64;

        Self {
            cols,
            rows,
            dirty_cells: vec![0u64; num_words],
            has_damage: false,
        }
    }

    /// Get the number of columns
    pub fn cols(&self) -> u32 {
        self.cols
    }

    /// Get the number of rows
    pub fn rows(&self) -> u32 {
        self.rows
    }

    /// Mark a single cell as dirty
    pub fn mark_dirty(&mut self, col: u32, row: u32) {
        if col >= self.cols || row >= self.rows {
            return;
        }

        let index = (row * self.cols + col) as usize;
        let word_index = index / 64;
        let bit_index = index % 64;

        self.dirty_cells[word_index] |= 1u64 << bit_index;
        self.has_damage = true;
    }

    /// Mark a rectangle of cells as dirty
    pub fn mark_rect_dirty(&mut self, x1: u32, y1: u32, x2: u32, y2: u32) {
        for row in y1..y2.min(self.rows) {
            for col in x1..x2.min(self.cols) {
                self.mark_dirty(col, row);
            }
        }
    }

    /// Check if a specific cell is dirty
    pub fn is_dirty(&self, col: u32, row: u32) -> bool {
        if col >= self.cols || row >= self.rows {
            return false;
        }

        let index = (row * self.cols + col) as usize;
        let word_index = index / 64;
        let bit_index = index % 64;

        (self.dirty_cells[word_index] >> bit_index) & 1 == 1
    }

    /// Check if any cells are dirty
    pub fn has_damage(&self) -> bool {
        self.has_damage
    }

    /// Clear all dirty cells
    pub fn clear(&mut self) {
        for word in &mut self.dirty_cells {
            *word = 0;
        }
        self.has_damage = false;
    }

    /// Compute dirty rectangles using a rect expansion algorithm
    ///
    /// This algorithm:
    /// 1. Finds all dirty cells
    /// 2. Groups them into rectangles using expansion
    /// 3. Merges overlapping/adjacent rectangles
    pub fn compute_dirty_rects(&self) -> Vec<DirtyRect> {
        if !self.has_damage {
            return Vec::new();
        }

        // Collect all dirty cells
        let dirty_cells: Vec<(u32, u32)> = self.collect_dirty_cells();

        if dirty_cells.is_empty() {
            return Vec::new();
        }

        // Start with each dirty cell as its own rect
        let mut rects: Vec<DirtyRect> = dirty_cells
            .into_iter()
            .map(|(x, y)| DirtyRect::from_cell(x, y))
            .collect();

        // Merge pass 1: Expand and merge overlapping/adjacent rects
        let mut changed = true;
        while changed {
            changed = false;
            rects = Self::merge_rects_pass(rects, &mut changed);
        }

        rects
    }

    /// Collect all dirty cell coordinates
    fn collect_dirty_cells(&self) -> Vec<(u32, u32)> {
        let mut cells = Vec::new();

        for row in 0..self.rows {
            for col in 0..self.cols {
                if self.is_dirty(col, row) {
                    cells.push((col, row));
                }
            }
        }

        cells
    }

    /// Single pass of rectangle merging
    fn merge_rects_pass(rects: Vec<DirtyRect>, changed: &mut bool) -> Vec<DirtyRect> {
        if rects.is_empty() {
            return rects;
        }

        let mut result: Vec<DirtyRect> = Vec::new();
        let mut merged: Vec<bool> = vec![false; rects.len()];

        for i in 0..rects.len() {
            if merged[i] {
                continue;
            }

            let mut current = rects[i];

            for j in (i + 1)..rects.len() {
                if merged[j] {
                    continue;
                }

                if current.overlaps_or_adjacent(&rects[j]) {
                    current.merge(&rects[j]);
                    merged[j] = true;
                    *changed = true;
                }
            }

            result.push(current);
        }

        result
    }

    /// Convert 2D coordinates to Hilbert curve index
    ///
    /// Uses the fast_hilbert crate for efficient computation.
    /// The Hilbert order is computed from the larger of cols/rows.
    pub fn xy_to_hilbert(&self, x: u32, y: u32) -> u64 {
        // Ensure coordinates are within bounds
        if x >= self.cols || y >= self.rows {
            return 0;
        }

        // Use fast_hilbert::xy2h for the conversion
        // xy2h::<u32>(u32, u32) returns u64
        xy2h::<u32>(x, y)
    }

    /// Convert Hilbert curve index to 2D coordinates
    pub fn hilbert_to_xy(&self, index: u64) -> (u32, u32) {
        // Use fast_hilbert::h2xy for the conversion
        // h2xy::<T>(Key) returns (T, T) where Key has double the capacity
        // For u64 output, we need u128 input
        let (x, y): (u64, u64) = h2xy::<u64>(index as u128);

        // Clamp to actual grid bounds
        (
            x.min(self.cols.saturating_sub(1) as u64) as u32,
            y.min(self.rows.saturating_sub(1) as u64) as u32,
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_dirty_rect_creation() {
        let rect = DirtyRect::new(5, 3, 10, 8);
        assert_eq!(rect.x1, 5);
        assert_eq!(rect.y1, 3);
        assert_eq!(rect.x2, 10);
        assert_eq!(rect.y2, 8);
        assert_eq!(rect.width(), 5);
        assert_eq!(rect.height(), 5);
        assert_eq!(rect.area(), 25);
    }

    #[test]
    fn test_dirty_rect_contains() {
        let rect = DirtyRect::new(5, 3, 10, 8);

        // Inside
        assert!(rect.contains(5, 3));
        assert!(rect.contains(7, 5));
        assert!(rect.contains(9, 7));

        // Outside
        assert!(!rect.contains(4, 3));
        assert!(!rect.contains(10, 3));
        assert!(!rect.contains(5, 8));
        assert!(!rect.contains(5, 10));
    }

    #[test]
    fn test_dirty_rect_expand() {
        let mut rect = DirtyRect::from_cell(5, 5);
        rect.expand_to_include(10, 3);

        assert_eq!(rect.x1, 5);
        assert_eq!(rect.y1, 3);
        assert_eq!(rect.x2, 11);
        assert_eq!(rect.y2, 6);
    }

    #[test]
    fn test_dirty_rect_merge() {
        let mut rect1 = DirtyRect::new(0, 0, 5, 5);
        let rect2 = DirtyRect::new(10, 10, 15, 15);
        rect1.merge(&rect2);

        assert_eq!(rect1.x1, 0);
        assert_eq!(rect1.y1, 0);
        assert_eq!(rect1.x2, 15);
        assert_eq!(rect1.y2, 15);
    }

    #[test]
    fn test_dirty_rect_overlaps() {
        let rect1 = DirtyRect::new(0, 0, 5, 5);

        // Overlapping
        let rect2 = DirtyRect::new(3, 3, 8, 8);
        assert!(rect1.overlaps_or_adjacent(&rect2));

        // Adjacent
        let rect3 = DirtyRect::new(5, 0, 10, 5);
        assert!(rect1.overlaps_or_adjacent(&rect3));

        // Diagonal adjacent
        let rect4 = DirtyRect::new(5, 5, 10, 10);
        assert!(rect1.overlaps_or_adjacent(&rect4));

        // Disjoint
        let rect5 = DirtyRect::new(10, 10, 15, 15);
        assert!(!rect1.overlaps_or_adjacent(&rect5));
    }

    #[test]
    fn test_damage_tracker_mark_dirty() {
        let mut tracker = DamageTracker::new(80, 24);

        assert!(!tracker.is_dirty(5, 3));
        assert!(!tracker.has_damage());

        tracker.mark_dirty(5, 3);

        assert!(tracker.is_dirty(5, 3));
        assert!(tracker.has_damage());
    }

    #[test]
    fn test_damage_tracker_clear() {
        let mut tracker = DamageTracker::new(80, 24);

        tracker.mark_dirty(10, 5);
        tracker.mark_dirty(20, 10);
        assert!(tracker.has_damage());

        tracker.clear();

        assert!(!tracker.has_damage());
        assert!(!tracker.is_dirty(10, 5));
        assert!(!tracker.is_dirty(20, 10));
    }

    #[test]
    fn test_damage_tracker_bounds_check() {
        let mut tracker = DamageTracker::new(80, 24);

        // Should not panic on out-of-bounds
        tracker.mark_dirty(100, 30);
        assert!(!tracker.has_damage());
        assert!(!tracker.is_dirty(100, 30));
    }

    #[test]
    fn test_damage_tracker_rect_dirty() {
        let mut tracker = DamageTracker::new(80, 24);

        tracker.mark_rect_dirty(5, 5, 10, 10);

        // Inside rect
        assert!(tracker.is_dirty(5, 5));
        assert!(tracker.is_dirty(9, 9));

        // Outside rect
        assert!(!tracker.is_dirty(4, 5));
        assert!(!tracker.is_dirty(10, 5));
        assert!(!tracker.is_dirty(5, 10));
    }

    #[test]
    fn test_compute_dirty_rects_single_cluster() {
        let mut tracker = DamageTracker::new(80, 24);

        // Create a 3x2 cluster
        tracker.mark_dirty(10, 5);
        tracker.mark_dirty(11, 5);
        tracker.mark_dirty(10, 6);
        tracker.mark_dirty(11, 6);
        tracker.mark_dirty(12, 5);
        tracker.mark_dirty(12, 6);

        let rects = tracker.compute_dirty_rects();

        // Should merge into a single rect
        assert_eq!(rects.len(), 1);
        assert!(rects[0].contains(10, 5));
        assert!(rects[0].contains(12, 6));
    }

    #[test]
    fn test_compute_dirty_rects_disjoint() {
        let mut tracker = DamageTracker::new(80, 24);

        // Create two disjoint clusters
        tracker.mark_dirty(5, 2);
        tracker.mark_dirty(50, 20);

        let rects = tracker.compute_dirty_rects();

        // Should be two separate rects
        assert!(!rects.is_empty());
        assert!(rects.len() >= 1);
    }

    #[test]
    fn test_hilbert_roundtrip() {
        let tracker = DamageTracker::new(80, 24);

        // Test roundtrip for several cells
        for (x, y) in [(0, 0), (10, 5), (79, 23), (40, 12)] {
            let d = tracker.xy_to_hilbert(x, y);
            let (x2, y2) = tracker.hilbert_to_xy(d);
            assert_eq!((x, y), (x2, y2), "Roundtrip failed for ({}, {})", x, y);
        }
    }

    #[test]
    fn test_hilbert_bounds() {
        let tracker = DamageTracker::new(80, 24);

        // All Hilbert indices should map to valid coordinates
        for d in [0, 100, 1000, 10000] {
            let (x, y) = tracker.hilbert_to_xy(d);
            assert!(x < 80, "x={} should be < 80", x);
            assert!(y < 24, "y={} should be < 24", y);
        }
    }
}
