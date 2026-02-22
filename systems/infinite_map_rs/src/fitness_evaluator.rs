//! Fitness Evaluator - Measures tile performance and survival capability
//!
//! Evaluates tiles based on:
//! - Boot time and startup performance
//! - Runtime stability and crash resistance
//! - Resource efficiency (CPU, memory, energy)
//! - User interaction and utility metrics

use crate::tile::{Tile, FitnessScore};
use std::time::{SystemTime, UNIX_EPOCH};
use std::collections::HashMap;

/// Fitness evaluation context
pub struct FitnessEvaluator {
    /// Historical performance data
    performance_history: HashMap<String, Vec<PerformanceSample>>,
    /// User interaction weights
    user_weights: UserWeights,
}

#[derive(Debug, Clone)]
pub struct PerformanceSample {
    pub timestamp: f64,
    pub boot_time: Option<f64>,
    pub cpu_usage: f64,
    pub memory_usage: u64,
    pub stability_score: f64,
    pub user_satisfaction: f64,
}

#[derive(Debug, Clone)]
pub struct UserWeights {
    pub boot_time_weight: f64,
    pub stability_weight: f64,
    pub performance_weight: f64,
    pub utility_weight: f64,
}

impl Default for UserWeights {
    fn default() -> Self {
        Self {
            boot_time_weight: 0.2,
            stability_weight: 0.3,
            performance_weight: 0.3,
            utility_weight: 0.2,
        }
    }
}

impl FitnessEvaluator {
    pub fn new() -> Self {
        Self {
            performance_history: HashMap::new(),
            user_weights: UserWeights::default(),
        }
    }

    /// Evaluate fitness for a tile
    pub fn evaluate_tile(&mut self, tile: &mut Tile) {
        let tile_id = tile.id.clone();

        // Get recent performance samples
        let samples = self.performance_history.get(&tile_id)
            .cloned()
            .unwrap_or_default();

        // Calculate metrics from samples and current state
        let metrics = self.calculate_metrics(&samples, tile);

        // Update tile fitness
        tile.fitness = metrics;
        tile.update_fitness();
    }

    /// Record a performance sample for a tile
    pub fn record_sample(&mut self, tile_id: &str, sample: PerformanceSample) {
        self.performance_history
            .entry(tile_id.to_string())
            .or_insert_with(Vec::new)
            .push(sample);

        // Keep only recent samples (last 100)
        if let Some(samples) = self.performance_history.get_mut(tile_id) {
            if samples.len() > 100 {
                samples.remove(0);
            }
        }
    }

    /// Calculate fitness metrics from performance samples
    fn calculate_metrics(&self, samples: &[PerformanceSample], tile: &Tile) -> FitnessScore {
        if samples.is_empty() {
            return FitnessScore::default();
        }

        // Boot time: average of recent boot times
        let boot_times: Vec<f64> = samples.iter()
            .filter_map(|s| s.boot_time)
            .collect();
        let avg_boot_time = if boot_times.is_empty() {
            0.0
        } else {
            boot_times.iter().sum::<f64>() / boot_times.len() as f64
        };

        // Stability: based on consistency of performance
        let stability = self.calculate_stability(samples);

        // Performance: average CPU and memory efficiency
        let avg_cpu = samples.iter().map(|s| s.cpu_usage).sum::<f64>() / samples.len() as f64;
        let avg_memory = samples.iter().map(|s| s.memory_usage).sum::<u64>() as f64 / samples.len() as f64;
        let performance = self.calculate_performance_score(avg_cpu, avg_memory);

        // User utility: based on interaction history and satisfaction
        let user_utility = self.calculate_user_utility(tile);

        FitnessScore {
            boot_time_ms: avg_boot_time,
            stability_score: stability,
            performance_score: performance,
            user_utility,
            overall: 0.0, // Will be computed by FitnessScore::compute_overall
        }
    }

    /// Calculate stability score (0.0 to 1.0)
    fn calculate_stability(&self, samples: &[PerformanceSample]) -> f64 {
        if samples.len() < 2 {
            return 1.0; // Assume stable if insufficient data
        }

        // Stability based on variance in performance metrics
        let cpu_values: Vec<f64> = samples.iter().map(|s| s.cpu_usage).collect();
        let memory_values: Vec<f64> = samples.iter().map(|s| s.memory_usage as f64).collect();

        let cpu_variance = self.variance(&cpu_values);
        let memory_variance = self.variance(&memory_values);

        // Lower variance = higher stability
        let cpu_stability = 1.0 / (1.0 + cpu_variance / 100.0); // Normalize
        let memory_stability = 1.0 / (1.0 + memory_variance / (1024.0 * 1024.0)); // MB variance

        (cpu_stability + memory_stability) / 2.0
    }

    /// Calculate performance score (0.0 to 1.0)
    fn calculate_performance_score(&self, avg_cpu: f64, avg_memory: f64) -> f64 {
        // Performance score based on resource efficiency
        // Lower resource usage = higher score
        let cpu_score = 1.0 / (1.0 + avg_cpu / 100.0); // Normalize CPU %
        let memory_score = 1.0 / (1.0 + avg_memory / (1024.0 * 1024.0 * 1024.0)); // GB

        (cpu_score + memory_score) / 2.0
    }

    /// Calculate user utility score (0.0 to 1.0)
    fn calculate_user_utility(&self, tile: &Tile) -> f64 {
        let interactions = &tile.epigenetics.interaction_history;

        if interactions.is_empty() {
            return 0.5; // Neutral if no interactions
        }

        // Simple heuristic: more recent interactions = higher utility
        let now = current_timestamp();
        let recent_interactions = interactions.iter()
            .filter(|i| now - i.timestamp < 3600.0) // Last hour
            .count();

        let recency_score = (recent_interactions as f64 / 10.0).min(1.0); // Max at 10 interactions

        // Diversity of interaction types
        let unique_types: std::collections::HashSet<_> = interactions.iter()
            .map(|i| &i.event_type)
            .collect();
        let diversity_score = (unique_types.len() as f64 / 5.0).min(1.0); // Max at 5 types

        (recency_score + diversity_score) / 2.0
    }

    /// Calculate variance of a dataset
    fn variance(&self, data: &[f64]) -> f64 {
        if data.is_empty() {
            return 0.0;
        }

        let mean = data.iter().sum::<f64>() / data.len() as f64;
        let variance = data.iter()
            .map(|x| (x - mean).powi(2))
            .sum::<f64>() / data.len() as f64;

        variance
    }

    /// Get performance history for a tile
    pub fn get_history(&self, tile_id: &str) -> Vec<PerformanceSample> {
        self.performance_history.get(tile_id)
            .cloned()
            .unwrap_or_default()
    }

    /// Clear old performance data
    pub fn cleanup_old_data(&mut self, max_age_seconds: f64) {
        let now = current_timestamp();
        let cutoff = now - max_age_seconds;

        for samples in self.performance_history.values_mut() {
            samples.retain(|s| s.timestamp > cutoff);
        }

        // Remove empty histories
        self.performance_history.retain(|_, samples| !samples.is_empty());
    }

    /// Set user preference weights
    pub fn set_user_weights(&mut self, weights: UserWeights) {
        self.user_weights = weights;
    }
}

/// Current timestamp as f64
fn current_timestamp() -> f64 {
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap_or_default()
        .as_secs_f64()
}