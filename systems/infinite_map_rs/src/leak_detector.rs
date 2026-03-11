#![allow(dead_code, unused_imports, unused_variables)]
// src/leak_detector.rs
// Memory Leak Detector
// Visual memory leak detection through heap snapshot analysis
//
// This module tracks heap allocations over time, detects growing patterns,
// and provides visual feedback for potential memory leaks.

use std::collections::{HashMap, VecDeque};
use std::time::{Duration, Instant};
use crate::memory_texture::MemoryRegion;

/// Heap snapshot for leak detection
#[derive(Debug, Clone)]
pub struct HeapSnapshot {
    pub timestamp: Instant,
    pub allocated_pages: u32,
    pub free_pages: u32,
    pub leaked_regions: Vec<MemoryRegion>,
    pub allocation_pattern: HashMap<String, u32>,
    pub health_score: f32,
}

impl HeapSnapshot {
    /// Create a new heap snapshot
    pub fn new(
        allocated_pages: u32,
        free_pages: u32,
        allocation_pattern: HashMap<String, u32>,
    ) -> Self {
        Self {
            timestamp: Instant::now(),
            allocated_pages,
            free_pages,
            leaked_regions: Vec::new(),
            allocation_pattern,
            health_score: 1.0,
        }
    }

    /// Get total pages
    pub fn total_pages(&self) -> u32 {
        self.allocated_pages + self.free_pages
    }

    /// Get allocation ratio (0.0 - 1.0)
    pub fn allocation_ratio(&self) -> f32 {
        let total = self.total_pages();
        if total == 0 {
            return 0.0;
        }
        self.allocated_pages as f32 / total as f32
    }
}

/// Memory leak detector configuration
#[derive(Debug, Clone)]
pub struct LeakDetectorConfig {
    pub max_history: usize,
    pub growth_threshold: f32,
    pub leak_threshold: Duration,
    pub health_decay_rate: f32,
}

impl Default for LeakDetectorConfig {
    fn default() -> Self {
        Self {
            max_history: 100,
            growth_threshold: 0.1, // 10% growth rate
            leak_threshold: Duration::from_secs(30), // 30 seconds
            health_decay_rate: 0.01,
        }
    }
}

/// Memory leak detector
pub struct LeakDetector {
    history: VecDeque<HeapSnapshot>,
    config: LeakDetectorConfig,
}

impl LeakDetector {
    /// Create a new leak detector with default configuration
    pub fn new() -> Self {
        Self::with_config(LeakDetectorConfig::default())
    }

    /// Create a new leak detector with custom configuration
    ///
    /// # Arguments
    /// * `config` - Leak detector configuration
    pub fn with_config(config: LeakDetectorConfig) -> Self {
        Self {
            history: VecDeque::with_capacity(config.max_history),
            config,
        }
    }

    /// Create a default leak detector
    pub fn default() -> Self {
        Self::new()
    }

    /// Add a heap snapshot
    ///
    /// # Arguments
    /// * `snapshot` - Heap snapshot to add
    pub fn add_snapshot(&mut self, mut snapshot: HeapSnapshot) {
        // Calculate health score
        snapshot.health_score = self.calculate_health_score(&snapshot);

        // Detect leaks
        snapshot.leaked_regions = self.detect_leaks(&snapshot);

        self.history.push_back(snapshot);

        // Maintain max history size
        while self.history.len() > self.config.max_history {
            self.history.pop_front();
        }
    }

    /// Detect memory leaks from current snapshot
    ///
    /// # Arguments
    /// * `current` - Current heap snapshot
    ///
    /// # Returns
    /// Vector of potentially leaked memory regions
    pub fn detect_leaks(&self, current: &HeapSnapshot) -> Vec<MemoryRegion> {
        if self.history.is_empty() {
            return Vec::new();
        }

        let mut leaked_regions = Vec::new();

        // Compare with previous snapshots
        for prev in self.history.iter().rev().take(10) {
            let time_diff = current.timestamp.duration_since(prev.timestamp);

            if time_diff > self.config.leak_threshold {
                // Check for growing allocation pattern
                let growth_rate = self.calculate_growth_rate(prev, current);

                if growth_rate > self.config.growth_threshold {
                    // Identify regions that never deallocated
                    leaked_regions.extend(self.find_persistent_regions(prev, current));
                }

                break;
            }
        }

        leaked_regions
    }

    /// Calculate growth rate between two snapshots
    ///
    /// # Arguments
    /// * `prev` - Previous snapshot
    /// * `current` - Current snapshot
    ///
    /// # Returns
    /// Growth rate as a fraction (e.g., 0.1 = 10% growth)
    fn calculate_growth_rate(&self, prev: &HeapSnapshot, current: &HeapSnapshot) -> f32 {
        if prev.allocated_pages == 0 {
            return 0.0;
        }

        let growth = current.allocated_pages as f32 - prev.allocated_pages as f32;
        growth / prev.allocated_pages as f32
    }

    /// Find regions that persist between snapshots
    ///
    /// # Arguments
    /// * `prev` - Previous snapshot
    /// * `current` - Current snapshot
    ///
    /// # Returns
    /// Vector of persistent memory regions
    fn find_persistent_regions(&self, prev: &HeapSnapshot, current: &HeapSnapshot) -> Vec<MemoryRegion> {
        let mut persistent = Vec::new();

        // Compare allocation patterns
        for (region, count) in &current.allocation_pattern {
            if let Some(prev_count) = prev.allocation_pattern.get(region) {
                // Region exists in both snapshots
                if count > prev_count {
                    // Region grew - potential leak
                    // In practice, you'd track actual memory regions with addresses
                    // For now, we create a placeholder region
                    persistent.push(MemoryRegion {
                        name: format!("potential_leak_{}", region),
                        start_addr: 0,
                        end_addr: 0,
                        permissions: "rw-".to_string(),
                    });
                }
            } else {
                // New region in current snapshot
                // Check if it persists in subsequent snapshots
                if self.is_region_persistent(region) {
                    persistent.push(MemoryRegion {
                        name: format!("new_leak_{}", region),
                        start_addr: 0,
                        end_addr: 0,
                        permissions: "rw-".to_string(),
                    });
                }
            }
        }

        persistent
    }

    /// Check if a region persists across multiple snapshots
    ///
    /// # Arguments
    /// * `region_name` - Name of the region to check
    ///
    /// # Returns
    /// true if region persists, false otherwise
    fn is_region_persistent(&self, region_name: &str) -> bool {
        let mut count = 0;
        for snapshot in self.history.iter().rev().take(5) {
            if snapshot.allocation_pattern.contains_key(region_name) {
                count += 1;
            }
        }
        count >= 3 // Persist in at least 3 recent snapshots
    }

    /// Calculate memory health score
    ///
    /// # Arguments
    /// * `current` - Current heap snapshot
    ///
    /// # Returns
    /// Health score in [0, 1], where 1.0 is perfect health
    pub fn calculate_health_score(&self, current: &HeapSnapshot) -> f32 {
        if self.history.is_empty() {
            return 1.0; // Perfect health if no history
        }

        let mut health = 1.0;

        // Penalize for growth
        let growth = self.calculate_growth_rate(self.history.front().unwrap(), current);
        health -= growth * 2.0; // Double penalty for growth

        // Penalize for leaks
        let leaks = self.detect_leaks(current);
        health -= leaks.len() as f32 * 0.1;

        // Penalize for low allocation ratio (fragmentation)
        let allocation_ratio = current.allocation_ratio();
        if allocation_ratio < 0.5 {
            health -= (0.5 - allocation_ratio) * 0.5;
        }

        // Ensure health is in [0, 1] range
        health = health.max(0.0).min(1.0);

        health
    }

    /// Get latest snapshot
    ///
    /// # Returns
    /// Option containing the latest snapshot, or None if no snapshots exist
    pub fn get_latest_snapshot(&self) -> Option<&HeapSnapshot> {
        self.history.back()
    }

    /// Get snapshot history
    ///
    /// # Returns
    /// Reference to the snapshot history
    pub fn get_history(&self) -> &VecDeque<HeapSnapshot> {
        &self.history
    }

    /// Get current health score
    ///
    /// # Returns
    /// Current health score, or None if no snapshots exist
    pub fn get_health_score(&self) -> Option<f32> {
        self.get_latest_snapshot().map(|s| s.health_score)
    }

    /// Get current leak regions
    ///
    /// # Returns
    /// Vector of currently detected leak regions, or empty if none exist
    pub fn get_leak_regions(&self) -> Vec<MemoryRegion> {
        self.get_latest_snapshot()
            .map(|s| s.leaked_regions.clone())
            .unwrap_or_default()
    }

    /// Get growth rate over time window
    ///
    /// # Arguments
    /// * `window` - Number of snapshots to look back
    ///
    /// # Returns
    /// Growth rate, or None if insufficient history
    pub fn get_growth_rate(&self, window: usize) -> Option<f32> {
        if self.history.len() < window + 1 {
            return None;
        }

        let latest = self.history.back()?;
        let oldest = self.history.get(self.history.len() - window - 1)?;

        Some(self.calculate_growth_rate(oldest, latest))
    }

    /// Get allocation trend
    ///
    /// # Returns
    /// Tuple of (trend, confidence) where trend is -1.0 (declining) to 1.0 (growing)
    /// and confidence is 0.0 to 1.0
    pub fn get_allocation_trend(&self) -> (f32, f32) {
        if self.history.len() < 5 {
            return (0.0, 0.0);
        }

        let mut trend = 0.0;
        let mut count = 0;

        let snapshots: Vec<_> = self.history.iter().collect();
        for i in 1..snapshots.len() {
            let prev = &snapshots[i - 1];
            let curr = &snapshots[i];

            let growth = self.calculate_growth_rate(prev, curr);
            trend += growth.signum() * growth.abs().min(1.0);
            count += 1;
        }

        let avg_trend = if count > 0 { trend / count as f32 } else { 0.0 };
        let confidence = (count as f32 / self.history.len() as f32).min(1.0);

        (avg_trend, confidence)
    }

    /// Clear history
    pub fn clear_history(&mut self) {
        self.history.clear();
    }

    /// Get statistics
    ///
    /// # Returns
    /// String containing current statistics
    pub fn get_statistics(&self) -> String {
        let mut stats = String::new();

        if let Some(latest) = self.get_latest_snapshot() {
            stats.push_str(&format!("Allocated pages: {}\n", latest.allocated_pages));
            stats.push_str(&format!("Free pages: {}\n", latest.free_pages));
            stats.push_str(&format!("Allocation ratio: {:.2}%\n", latest.allocation_ratio() * 100.0));
            stats.push_str(&format!("Health score: {:.2}\n", latest.health_score));

            if let Some(growth) = self.get_growth_rate(10) {
                stats.push_str(&format!("Growth rate (10 snapshots): {:.2}%\n", growth * 100.0));
            }

            let (trend, confidence) = self.get_allocation_trend();
            stats.push_str(&format!("Allocation trend: {:.2} (confidence: {:.2})\n", trend, confidence));

            let leaks = self.get_leak_regions();
            stats.push_str(&format!("Detected leaks: {}\n", leaks.len()));
        } else {
            stats.push_str("No snapshots available\n");
        }

        stats
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_growth_rate() {
        let mut detector = LeakDetector::new();

        let snapshot1 = HeapSnapshot::new(1000, 9000, HashMap::new());
        let snapshot2 = HeapSnapshot::new(1100, 8900, HashMap::new());

        detector.add_snapshot(snapshot1);
        detector.add_snapshot(snapshot2);

        let growth = detector.calculate_growth_rate(
            detector.get_history().front().unwrap(),
            detector.get_history().back().unwrap()
        );
        assert!((growth - 0.1).abs() < 0.01);
    }

    #[test]
    fn test_health_score() {
        let mut detector = LeakDetector::new();

        let snapshot1 = HeapSnapshot::new(1000, 9000, HashMap::new());
        let snapshot2 = HeapSnapshot::new(1200, 8800, HashMap::new());

        detector.add_snapshot(snapshot1);
        detector.add_snapshot(snapshot2);

        let health = detector.calculate_health_score(detector.get_history().back().unwrap());
        assert!(health < 1.0 && health > 0.0);
    }

    #[test]
    fn test_allocation_ratio() {
        let snapshot = HeapSnapshot::new(5000, 5000, HashMap::new());
        assert_eq!(snapshot.allocation_ratio(), 0.5);

        let snapshot2 = HeapSnapshot::new(8000, 2000, HashMap::new());
        assert_eq!(snapshot2.allocation_ratio(), 0.8);
    }

    #[test]
    fn test_allocation_trend() {
        let mut detector = LeakDetector::new();

        // Add snapshots with growing allocation
        for i in 0..10 {
            let allocated = 1000 + i * 100;
            let free = 10000 - allocated;
            detector.add_snapshot(HeapSnapshot::new(allocated as u32, free as u32, HashMap::new()));
        }

        let (trend, confidence) = detector.get_allocation_trend();
        assert!(trend > 0.0, "Trend should be positive (growing)");
        assert!(confidence > 0.0, "Confidence should be positive");
    }

    #[test]
    fn test_history_management() {
        let mut detector = LeakDetector::with_config(LeakDetectorConfig {
            max_history: 5,
            ..Default::default()
        });

        // Add more snapshots than max_history
        for i in 0..10 {
            detector.add_snapshot(HeapSnapshot::new(1000, 9000, HashMap::new()));
        }

        assert_eq!(detector.get_history().len(), 5, "History should be limited to max_history");
    }

    #[test]
    fn test_clear_history() {
        let mut detector = LeakDetector::new();

        detector.add_snapshot(HeapSnapshot::new(1000, 9000, HashMap::new()));
        detector.add_snapshot(HeapSnapshot::new(1100, 8900, HashMap::new()));

        assert_eq!(detector.get_history().len(), 2);

        detector.clear_history();
        assert_eq!(detector.get_history().len(), 0);
        assert!(detector.get_health_score().is_none());
    }
}
