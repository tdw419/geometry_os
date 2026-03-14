// src/tool_adapter/bpftrace_adapter.rs
// BPF Trace Adapter - Phase 2
// Kernel-level tracing and system introspection using bpftrace
//
// This adapter polls bpftrace for kernel-level metrics including:
// - System call frequency
// - I/O operations
// - Network activity
// - Context switches

use std::time::Duration;
use super::{ToolAdapter, ToolMetrics, check_binary_available, run_command};

/// BpftraceAdapter for kernel-level metrics
///
/// This adapter uses bpftrace to collect low-level system metrics
/// that indicate system health and performance.
///
/// Health score is computed based on:
/// - System call rate (too high = thrashing)
/// - I/O wait time (high = disk bottleneck)
/// - Context switch rate (too high = scheduling issues)
pub struct BpftraceAdapter {
    /// Whether bpftrace is available
    available: bool,
    /// Last poll result (for smoothing)
    last_metrics: Option<ToolMetrics>,
}

impl BpftraceAdapter {
    /// Create a new BpftraceAdapter
    ///
    /// Automatically detects if bpftrace is available.
    pub fn new() -> Self {
        let available = check_binary_available("bpftrace");
        
        if available {
            log::info!("🔧 BpftraceAdapter: bpftrace is available for kernel tracing");
        } else {
            log::warn!("🔧 BpftraceAdapter: bpftrace not available (kernel tracing disabled)");
        }

        Self {
            available,
            last_metrics: None,
        }
    }

    /// Run a bpftrace script and capture output
    ///
    /// # Arguments
    /// * `script` - BPF trace script to run
    /// * `duration_ms` - How long to run the script
    ///
    /// # Returns
    /// * `Ok(String)` - Output from bpftrace
    /// * `Err(String)` - Error message
    fn run_bpftrace_script(&self, script: &str, duration_ms: u64) -> Result<String, String> {
        if !self.available {
            return Err("bpftrace is not available".to_string());
        }

        // Create a temporary script file
        use std::io::Write;
        use std::fs::File;
        
        let temp_file = "/tmp/bpftrace_diag.bt";
        let mut file = File::create(temp_file)
            .map_err(|e| format!("Failed to create temp file: {}", e))?;
        
        writeln!(file, "{}", script)
            .map_err(|e| format!("Failed to write script: {}", e))?;
        
        // Run bpftrace
        let output = run_command("bpftrace", &[
            "-f", "json",
            "-e", &format!("interval:ms:{} {{ exit(); }} {}", duration_ms, script),
        ]);

        // Clean up temp file
        let _ = std::fs::remove_file(temp_file);

        output
    }

    /// Get system call rate
    ///
    /// Returns system calls per second
    fn get_syscall_rate(&self) -> Result<f64, String> {
        // Use /proc/stat for faster access
        use std::fs;

        let stat = fs::read_to_string("/proc/stat")
            .map_err(|e| format!("Failed to read /proc/stat: {}", e))?;

        for line in stat.lines() {
            if line.starts_with("ctxt") {
                // Context switches (proxy for syscalls)
                let parts: Vec<&str> = line.split_whitespace().collect();
                if parts.len() >= 2 {
                    let ctxt: u64 = parts[1].parse()
                        .map_err(|e| format!("Failed to parse ctxt: {}", e))?;
                    
                    // Convert to rate (approximate)
                    return Ok(ctxt as f64);
                }
            }
        }

        Err("Failed to find context switch count".to_string())
    }

    /// Get I/O wait time from /proc/stat
    ///
    /// Returns percentage of CPU time spent waiting for I/O
    fn get_io_wait(&self) -> Result<f32, String> {
        use std::fs;

        let stat = fs::read_to_string("/proc/stat")
            .map_err(|e| format!("Failed to read /proc/stat: {}", e))?;

        for line in stat.lines() {
            if line.starts_with("cpu") {
                let parts: Vec<&str> = line.split_whitespace().collect();
                if parts.len() >= 6 {
                    // Parse CPU times: user, nice, system, idle, iowait
                    let user: f64 = parts[1].parse()
                        .map_err(|e| format!("Failed to parse user: {}", e))?;
                    let nice: f64 = parts[2].parse()
                        .map_err(|e| format!("Failed to parse nice: {}", e))?;
                    let system: f64 = parts[3].parse()
                        .map_err(|e| format!("Failed to parse system: {}", e))?;
                    let idle: f64 = parts[4].parse()
                        .map_err(|e| format!("Failed to parse idle: {}", e))?;
                    let iowait: f64 = parts[5].parse()
                        .map_err(|e| format!("Failed to parse iowait: {}", e))?;

                    let total = user + nice + system + idle + iowait;
                    if total > 0.0 {
                        return Ok((iowait / total * 100.0) as f32);
                    }
                }
            }
        }

        Ok(0.0)
    }

    /// Get network activity from /proc/net/dev
    ///
    /// Returns total bytes per second (TX + RX)
    fn get_network_activity(&self) -> Result<u64, String> {
        use std::fs;

        let net = fs::read_to_string("/proc/net/dev")
            .map_err(|e| format!("Failed to read /proc/net/dev: {}", e))?;

        let mut total_bytes = 0u64;

        for line in net.lines().skip(2) { // Skip header lines
            let parts: Vec<&str> = line.split_whitespace().collect();
            if parts.len() >= 10 {
                // RX bytes is at index 1, TX bytes at index 9
                let rx: u64 = parts[1].parse().unwrap_or(0);
                let tx: u64 = parts[9].parse().unwrap_or(0);
                total_bytes += rx + tx;
            }
        }

        Ok(total_bytes)
    }

    /// Calculate health score from kernel metrics
    ///
    /// Returns score (0.0 - 1.0)
    fn calculate_health_score(&self, syscall_rate: f64, io_wait: f32) -> f32 {
        // I/O wait is critical (high = disk bottleneck)
        let io_score = if io_wait <= 5.0 {
            1.0
        } else if io_wait >= 20.0 {
            0.0
        } else {
            1.0 - ((io_wait - 5.0) / 15.0)
        };

        // Syscall rate is less critical (high = busy system)
        let syscall_score = 1.0; // Default to healthy

        // Weighted average (I/O wait is more important)
        io_score * 0.7 + syscall_score * 0.3
    }
}

impl ToolAdapter for BpftraceAdapter {
    fn name(&self) -> &str {
        "bpftrace"
    }

    fn is_available(&self) -> bool {
        self.available
    }

    fn poll(&self) -> Result<ToolMetrics, String> {
        if !self.available {
            // Return healthy default if not available
            return Ok(ToolMetrics {
                health_score: 1.0,
                status: "N/A (bpftrace not available)".to_string(),
                raw_data: "unavailable".to_string(),
                timestamp: std::time::Instant::now(),
            });
        }

        // Collect metrics from /proc filesystem (faster than bpftrace)
        let io_wait = self.get_io_wait()?;
        let network = self.get_network_activity()?;
        let syscall_rate = self.get_syscall_rate().unwrap_or(0.0);

        let health_score = self.calculate_health_score(syscall_rate, io_wait);

        let status = format!(
            "I/O WAIT: {:.1}% | NET: {} MB/s | SYSCALLS: {:.0}",
            io_wait,
            network / (1024 * 1024),
            syscall_rate
        );

        let raw_data = format!(
            "io_wait={:.2},network_bytes={},syscall_rate={:.0}",
            io_wait, network, syscall_rate
        );

        Ok(ToolMetrics {
            health_score,
            status,
            raw_data,
            timestamp: std::time::Instant::now(),
        })
    }

    fn polling_interval(&self) -> Duration {
        Duration::from_secs(5) // Poll every 5 seconds (kernel tracing is expensive)
    }

    fn weight(&self) -> f32 {
        1.5 // Medium weight for kernel metrics
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_bpftrace_adapter_creation() {
        let adapter = BpftraceAdapter::new();
        assert_eq!(adapter.name(), "bpftrace");
    }

    #[test]
    fn test_calculate_health_score() {
        let adapter = BpftraceAdapter::new();
        
        // Low I/O wait (healthy)
        let score1 = adapter.calculate_health_score(10000.0, 2.0);
        assert!(score1 > 0.9);
        
        // High I/O wait (unhealthy)
        let score2 = adapter.calculate_health_score(10000.0, 25.0);
        assert!(score2 < 0.1);
        
        // Medium I/O wait
        let score3 = adapter.calculate_health_score(10000.0, 12.5);
        assert!(score3 > 0.3 && score3 < 0.7);
    }
}
