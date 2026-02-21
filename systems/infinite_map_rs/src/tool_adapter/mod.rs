// src/tool_adapter/mod.rs
// Tool Adapter System - Phase 2
// Plugin-style architecture for integrating deep-system tools into PAS logic
//
// This module provides a trait-based system for integrating external tools
// like btop, bpftrace, and other system monitoring tools into the
// Diagnostic Overlay's PAS (Performance, Aesthetic, System) scoring.

use std::time::Duration;

/// Tool health score (0.0 - 1.0)
pub type ToolHealthScore = f32;

/// Tool-specific metrics collected during polling
#[derive(Debug, Clone)]
pub struct ToolMetrics {
    /// Health score for this tool (0.0 = critical, 1.0 = optimal)
    pub health_score: ToolHealthScore,
    /// Human-readable status message
    pub status: String,
    /// Raw metrics data (tool-specific)
    pub raw_data: String,
    /// Timestamp of this measurement
    pub timestamp: std::time::Instant,
}

/// Trait that all tool adapters must implement
///
/// This trait defines the interface for integrating external system tools
/// into the diagnostic system. Each adapter is responsible for:
/// 1. Detecting if the tool is available
/// 2. Polling the tool for metrics
/// 3. Computing a health score (0.0 - 1.0)
pub trait ToolAdapter: Send + Sync {
    /// Get the unique name of this adapter
    fn name(&self) -> &str;

    /// Check if this tool is available on the system
    ///
    /// This should check for binary availability (e.g., 'btop --version')
    /// and return true if the tool can be used.
    fn is_available(&self) -> bool;

    /// Poll the tool for current metrics
    ///
    /// This method is called periodically (typically every 1-5 seconds)
    /// to collect metrics from the tool. It should not block the main thread.
    ///
    /// # Returns
    /// * `Ok(ToolMetrics)` - Successfully collected metrics
    /// * `Err(String)` - Error message if polling failed
    fn poll(&self) -> Result<ToolMetrics, String>;

    /// Get the recommended polling interval for this tool
    ///
    /// Different tools may need different polling frequencies:
    /// - btop: 1-2 seconds (system metrics change quickly)
    /// - bpftrace: 5-10 seconds (kernel tracing is expensive)
    fn polling_interval(&self) -> Duration;

    /// Get the weight of this tool in the System (S) component of PAS
    ///
    /// The System component is calculated as a weighted average of all
    /// tool health scores. This allows more critical tools to have
    /// greater impact on the overall PAS score.
    ///
    /// Default: 1.0 (equal weight)
    fn weight(&self) -> f32 {
        1.0
    }
}

/// Helper function to check if a binary is available
///
/// This runs the command with `--version` flag and returns true
/// if it succeeds (exit code 0).
///
/// # Arguments
/// * `binary_name` - Name of the binary to check (e.g., "btop")
///
/// # Returns
/// * `true` if binary is available and responds to --version
/// * `false` otherwise
pub fn check_binary_available(binary_name: &str) -> bool {
    use std::process::Command;

    match Command::new(binary_name)
        .arg("--version")
        .output()
    {
        Ok(output) => output.status.success(),
        Err(_) => false,
    }
}

/// Helper function to run a command and capture its output
///
/// # Arguments
/// * `command` - Command to run
/// * `args` - Arguments to pass to the command
///
/// # Returns
/// * `Ok(String)` - Stdout output from the command
/// * `Err(String)` - Error message if command failed
pub fn run_command(command: &str, args: &[&str]) -> Result<String, String> {
    use std::process::Command;

    match Command::new(command)
        .args(args)
        .output()
    {
        Ok(output) => {
            if output.status.success() {
                Ok(String::from_utf8_lossy(&output.stdout).to_string())
            } else {
                Err(format!(
                    "Command failed with exit code: {}",
                    output.status.code().unwrap_or(-1)
                ))
            }
        }
        Err(e) => Err(format!("Failed to execute command: {}", e)),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_check_binary_available() {
        // Test with a binary that should exist (sh)
        assert!(check_binary_available("sh"));
        
        // Test with a binary that likely doesn't exist
        assert!(!check_binary_available("nonexistent_binary_12345"));
    }

    #[test]
    fn test_run_command() {
        // Test running a simple command
        let result = run_command("echo", &["hello"]);
        assert!(result.is_ok());
        assert!(result.unwrap().contains("hello"));
    }
}

// Re-export adapters
pub mod btop_adapter;
pub mod bpftrace_adapter;

// Re-export for convenience
pub use btop_adapter::BtopAdapter;
pub use bpftrace_adapter::BpftraceAdapter;
