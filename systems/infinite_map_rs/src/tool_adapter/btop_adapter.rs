// src/tool_adapter/btop_adapter.rs
// Btop Adapter - Phase 2
// System metrics collection using btop (or htop as fallback)
//
// This adapter polls btop for CPU, memory, and system load metrics
// and computes a health score based on resource utilization.

use std::time::Duration;
use super::{ToolAdapter, ToolMetrics, check_binary_available};

/// BtopAdapter for system metrics collection
///
/// This adapter uses btop (or htop as fallback) to collect:
/// - CPU utilization
/// - Memory usage
/// - System load averages
///
/// Health score is computed as:
/// - 1.0 if all metrics are within healthy ranges
/// - Decreases linearly as metrics approach critical thresholds
pub struct BtopAdapter {
    /// Whether to use btop (true) or htop (false)
    use_btop: bool,
    /// Thresholds for health calculation
    thresholds: HealthThresholds,
}

/// Health thresholds for system metrics
#[derive(Debug, Clone)]
struct HealthThresholds {
    /// CPU utilization warning threshold (percentage)
    cpu_warning: f32,
    /// CPU utilization critical threshold (percentage)
    cpu_critical: f32,
    /// Memory usage warning threshold (percentage)
    memory_warning: f32,
    /// Memory usage critical threshold (percentage)
    memory_critical: f32,
    /// Load average warning threshold (per CPU core)
    load_warning: f32,
    /// Load average critical threshold (per CPU core)
    load_critical: f32,
}

impl Default for HealthThresholds {
    fn default() -> Self {
        Self {
            cpu_warning: 70.0,
            cpu_critical: 90.0,
            memory_warning: 75.0,
            memory_critical: 90.0,
            load_warning: 2.0,
            load_critical: 4.0,
        }
    }
}

impl BtopAdapter {
    /// Create a new BtopAdapter
    ///
    /// Automatically detects if btop is available, falls back to htop.
    pub fn new() -> Self {
        let use_btop = check_binary_available("btop");
        
        log::info!(
            "🔧 BtopAdapter: Using {} for system metrics",
            if use_btop { "btop" } else { "htop" }
        );

        Self {
            use_btop,
            thresholds: HealthThresholds::default(),
        }
    }

    /// Get the binary name to use (btop or htop)
    fn binary_name(&self) -> &str {
        if self.use_btop {
            "btop"
        } else {
            "htop"
        }
    }

    /// Parse CPU utilization from /proc/stat
    ///
    /// Returns average CPU utilization as percentage (0.0 - 100.0)
    fn parse_cpu_utilization(&self) -> Result<f32, String> {
        use std::fs;

        let stat = fs::read_to_string("/proc/stat")
            .map_err(|e| format!("Failed to read /proc/stat: {}", e))?;

        // Parse first line (aggregate CPU)
        let line = stat.lines().next()
            .ok_or("No data in /proc/stat")?;

        let parts: Vec<&str> = line.split_whitespace().collect();
        if parts.len() < 8 {
            return Err("Invalid /proc/stat format".to_string());
        }

        // Calculate CPU usage from user, nice, system, idle times
        let user: f64 = parts[1].parse()
            .map_err(|e| format!("Failed to parse user time: {}", e))?;
        let nice: f64 = parts[2].parse()
            .map_err(|e| format!("Failed to parse nice time: {}", e))?;
        let system: f64 = parts[3].parse()
            .map_err(|e| format!("Failed to parse system time: {}", e))?;
        let idle: f64 = parts[4].parse()
            .map_err(|e| format!("Failed to parse idle time: {}", e))?;

        let total = user + nice + system + idle;
        let usage = if total > 0.0 {
            ((user + nice + system) / total) * 100.0
        } else {
            0.0
        };

        Ok(usage as f32)
    }

    /// Parse memory usage from /proc/meminfo
    ///
    /// Returns memory utilization as percentage (0.0 - 100.0)
    fn parse_memory_usage(&self) -> Result<f32, String> {
        use std::fs;

        let meminfo = fs::read_to_string("/proc/meminfo")
            .map_err(|e| format!("Failed to read /proc/meminfo: {}", e))?;

        let mut mem_total: u64 = 0;
        let mut mem_available: u64 = 0;

        for line in meminfo.lines() {
            let parts: Vec<&str> = line.split_whitespace().collect();
            if parts.len() >= 2 {
                match parts[0] {
                    "MemTotal:" => {
                        mem_total = parts[1].parse()
                            .unwrap_or(0);
                    }
                    "MemAvailable:" => {
                        mem_available = parts[1].parse()
                            .unwrap_or(0);
                    }
                    _ => {}
                }
            }
        }

        if mem_total == 0 {
            return Err("Failed to parse MemTotal".to_string());
        }

        let usage = if mem_available > 0 {
            ((mem_total - mem_available) as f32 / mem_total as f32) * 100.0
        } else {
            0.0
        };

        Ok(usage)
    }

    /// Parse load average from /proc/loadavg
    ///
    /// Returns 1-minute load average
    fn parse_load_average(&self) -> Result<f32, String> {
        use std::fs;

        let loadavg = fs::read_to_string("/proc/loadavg")
            .map_err(|e| format!("Failed to read /proc/loadavg: {}", e))?;

        let parts: Vec<&str> = loadavg.split_whitespace().collect();
        if parts.is_empty() {
            return Err("No data in /proc/loadavg".to_string());
        }

        parts[0].parse()
            .map_err(|e| format!("Failed to parse load average: {}", e))
    }

    /// Get number of CPU cores
    fn get_cpu_cores(&self) -> usize {
        use std::fs;

        match fs::read_to_string("/proc/cpuinfo") {
            Ok(cpuinfo) => {
                cpuinfo.lines()
                    .filter(|line| line.starts_with("processor"))
                    .count()
            }
            Err(_) => 1, // Fallback to single core
        }
    }

    /// Calculate health score from metrics
    ///
    /// Returns score (0.0 - 1.0) based on thresholds
    fn calculate_health_score(&self, cpu: f32, memory: f32, load: f32) -> f32 {
        let cpu_score = self.calculate_metric_score(
            cpu,
            self.thresholds.cpu_warning,
            self.thresholds.cpu_critical,
        );
        
        let memory_score = self.calculate_metric_score(
            memory,
            self.thresholds.memory_warning,
            self.thresholds.memory_critical,
        );
        
        let cpu_cores = self.get_cpu_cores() as f32;
        let load_per_core = load / cpu_cores;
        let load_score = self.calculate_metric_score(
            load_per_core,
            self.thresholds.load_warning,
            self.thresholds.load_critical,
        );

        // Weighted average (CPU and memory are more important)
        cpu_score * 0.4 + memory_score * 0.4 + load_score * 0.2
    }

    /// Calculate score for a single metric
    ///
    /// Returns 1.0 if below warning, decreases linearly to 0.0 at critical
    fn calculate_metric_score(&self, value: f32, warning: f32, critical: f32) -> f32 {
        if value <= warning {
            1.0
        } else if value >= critical {
            0.0
        } else {
            // Linear interpolation between warning and critical
            1.0 - ((value - warning) / (critical - warning))
        }
    }
}

impl ToolAdapter for BtopAdapter {
    fn name(&self) -> &str {
        "btop"
    }

    fn is_available(&self) -> bool {
        check_binary_available(self.binary_name())
    }

    fn poll(&self) -> Result<ToolMetrics, String> {
        // Collect metrics from /proc filesystem (more efficient than spawning btop)
        let cpu = self.parse_cpu_utilization()?;
        let memory = self.parse_memory_usage()?;
        let load = self.parse_load_average()?;

        let health_score = self.calculate_health_score(cpu, memory, load);

        let status = format!(
            "CPU: {:.1}% | MEM: {:.1}% | LOAD: {:.2}",
            cpu, memory, load
        );

        let raw_data = format!(
            "cpu_utilization={:.2},memory_usage={:.2},load_average={:.2}",
            cpu, memory, load
        );

        Ok(ToolMetrics {
            health_score,
            status,
            raw_data,
            timestamp: std::time::Instant::now(),
        })
    }

    fn polling_interval(&self) -> Duration {
        Duration::from_secs(2) // Poll every 2 seconds
    }

    fn weight(&self) -> f32 {
        2.0 // Higher weight for system metrics
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_btop_adapter_creation() {
        let adapter = BtopAdapter::new();
        assert_eq!(adapter.name(), "btop");
    }

    #[test]
    fn test_calculate_metric_score() {
        let adapter = BtopAdapter::new();
        
        // Below warning
        assert_eq!(adapter.calculate_metric_score(50.0, 70.0, 90.0), 1.0);
        
        // At warning
        assert_eq!(adapter.calculate_metric_score(70.0, 70.0, 90.0), 1.0);
        
        // At critical
        assert_eq!(adapter.calculate_metric_score(90.0, 70.0, 90.0), 0.0);
        
        // Above critical
        assert_eq!(adapter.calculate_metric_score(95.0, 70.0, 90.0), 0.0);
        
        // Midpoint
        let mid = adapter.calculate_metric_score(80.0, 70.0, 90.0);
        assert!(mid > 0.0 && mid < 1.0);
    }
}
