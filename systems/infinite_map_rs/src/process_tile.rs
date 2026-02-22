//! Phase 45: Process Tiles - Linux processes as visual tiles on the Infinite Map
//!
//! This module extracts process information from /proc and renders each process
//! as a sub-tile on the Geometry OS map. Process metrics (CPU, memory) affect
//! tile appearance (brightness, size).

use std::collections::HashMap;
use std::fs;
use std::io::{self, BufRead, BufReader};
use std::path::Path;
use std::time::{Duration, Instant};

/// Represents a single Linux process extracted from /proc
#[derive(Debug, Clone)]
pub struct ProcessInfo {
    /// Process ID
    pub pid: u32,
    /// Process name (from /proc/[pid]/comm)
    pub name: String,
    /// Full command line (from /proc/[pid]/cmdline)
    pub cmdline: String,
    /// Process state (R=running, S=sleeping, etc.)
    pub state: char,
    /// CPU usage percentage (0.0 - 100.0)
    pub cpu_percent: f32,
    /// Memory usage in KB
    pub memory_kb: u64,
    /// Memory usage percentage
    pub memory_percent: f32,
    /// Parent PID
    pub ppid: u32,
    /// Number of threads
    pub num_threads: u32,
    /// User time in jiffies
    utime: u64,
    /// System time in jiffies
    stime: u64,
    /// Start time in jiffies
    starttime: u64,
}

impl ProcessInfo {
    /// Convert CPU usage to tile brightness (0.0 - 1.0)
    pub fn cpu_to_brightness(&self) -> f32 {
        // Minimum brightness of 0.2, scale up with CPU usage
        0.2 + (self.cpu_percent / 100.0).min(1.0) * 0.8
    }

    /// Convert memory usage to tile size multiplier (0.5 - 2.0)
    pub fn memory_to_size(&self) -> f32 {
        // Base size of 0.5, scale with memory percentage
        0.5 + (self.memory_percent / 100.0).min(1.0) * 1.5
    }

    /// Get semantic color based on process type
    pub fn semantic_color(&self) -> [f32; 4] {
        let name_lower = self.name.to_lowercase();
        
        // Color categories based on process type
        if name_lower.contains("rust") || name_lower.contains("cargo") || name_lower.contains("code") {
            // Development tools - Cyan
            [0.0, 0.8, 1.0, 1.0]
        } else if name_lower.contains("python") || name_lower.contains("node") || name_lower.contains("ruby") {
            // Script runtimes - Yellow
            [1.0, 0.9, 0.2, 1.0]
        } else if name_lower.contains("gpu") || name_lower.contains("wayland") || name_lower.contains("x11") {
            // Graphics/Display - Purple
            [0.7, 0.3, 1.0, 1.0]
        } else if name_lower.contains("kernel") || name_lower.contains("kthreadd") || name_lower.contains("systemd") {
            // System/Kernel - Green
            [0.2, 0.9, 0.4, 1.0]
        } else if name_lower.contains("bash") || name_lower.contains("zsh") || name_lower.contains("fish") {
            // Shell - Orange
            [1.0, 0.5, 0.1, 1.0]
        } else {
            // Default - Gray
            [0.6, 0.6, 0.7, 1.0]
        }
    }
}

/// Process Tile Manager - tracks all running processes
pub struct ProcessTileManager {
    /// Map of PID to ProcessInfo
    processes: HashMap<u32, ProcessInfo>,
    /// Previous CPU times for calculating delta
    prev_cpu_times: HashMap<u32, (u64, u64)>,
    /// Total system CPU time
    total_cpu_time: u64,
    /// Previous total CPU time
    prev_total_cpu_time: u64,
    /// Total system memory in KB
    total_memory_kb: u64,
    /// Last refresh time
    last_refresh: Instant,
    /// Refresh interval
    refresh_interval: Duration,
    /// Process tiles positioned on the map
    tile_positions: HashMap<u32, (f32, f32)>,
    /// Cluster centers for parent PIDs
    cluster_centers: HashMap<u32, (f32, f32)>,
    /// Whether running in VM context (use different /proc paths)
    vm_proc_path: Option<String>,
}

impl ProcessTileManager {
    /// Create a new ProcessTileManager
    pub fn new() -> Self {
        let total_memory_kb = Self::read_total_memory().unwrap_or(0);
        
        Self {
            processes: HashMap::new(),
            prev_cpu_times: HashMap::new(),
            total_cpu_time: 0,
            prev_total_cpu_time: 0,
            total_memory_kb,
            last_refresh: Instant::now(),
            refresh_interval: Duration::from_secs(2),
            tile_positions: HashMap::new(),
            cluster_centers: HashMap::new(),
            vm_proc_path: None,
        }
    }

    /// Create a ProcessTileManager for VM context (9P mounted /proc)
    pub fn new_for_vm(proc_path: &str) -> Self {
        let mut manager = Self::new();
        manager.vm_proc_path = Some(proc_path.to_string());
        manager
    }

    /// Get the /proc base path
    fn proc_path(&self) -> &Path {
        match &self.vm_proc_path {
            Some(path) => Path::new(path),
            None => Path::new("/proc"),
        }
    }

    /// Refresh process list from /proc
    pub fn refresh(&mut self) -> io::Result<()> {
        if self.last_refresh.elapsed() < self.refresh_interval {
            return Ok(());
        }

        // Read total CPU time first
        let new_total_cpu_time = self.read_total_cpu_time()?;
        let cpu_delta = new_total_cpu_time.saturating_sub(self.prev_total_cpu_time);

        // Scan /proc for process directories
        let proc_path = self.proc_path().to_path_buf();
        let mut new_processes = HashMap::new();
        let mut new_cpu_times = HashMap::new();

        if let Ok(entries) = fs::read_dir(&proc_path) {
            for entry in entries.flatten() {
                let file_name = entry.file_name();
                let name_str = file_name.to_string_lossy();
                
                // Check if directory name is a number (PID)
                if let Ok(pid) = name_str.parse::<u32>() {
                    if let Ok(mut process) = self.read_process_info(pid) {
                        // Calculate CPU percentage
                        let current_cpu = process.utime + process.stime;
                        if let Some(&(prev_utime, prev_stime)) = self.prev_cpu_times.get(&pid) {
                            let prev_cpu = prev_utime + prev_stime;
                            if cpu_delta > 0 {
                                process.cpu_percent = 
                                    ((current_cpu.saturating_sub(prev_cpu)) as f32 / cpu_delta as f32) * 100.0;
                            }
                        }

                        // Calculate memory percentage
                        if self.total_memory_kb > 0 {
                            process.memory_percent = 
                                (process.memory_kb as f32 / self.total_memory_kb as f32) * 100.0;
                        }

                        new_cpu_times.insert(pid, (process.utime, process.stime));
                        new_processes.insert(pid, process);
                    }
                }
            }
        }

        // Update positions for new processes
        for process in new_processes.values() {
            let pid = process.pid;
            let ppid = process.ppid;
            
            if !self.tile_positions.contains_key(&pid) {
                // Ensure parent has a cluster center
                if !self.cluster_centers.contains_key(&ppid) {
                    let center = self.generate_random_cluster_center();
                    self.cluster_centers.insert(ppid, center);
                }
                
                let position = self.calculate_tile_position(pid, ppid);
                self.tile_positions.insert(pid, position);
            }
        }

        // Remove positions and cluster centers for dead processes
        self.tile_positions.retain(|pid, _| new_processes.contains_key(pid));
        // Only keep cluster centers that have children or are themselves active processes
        let active_parents: std::collections::HashSet<u32> = new_processes.values().map(|p| p.ppid).collect();
        self.cluster_centers.retain(|ppid, _| active_parents.contains(ppid) || new_processes.contains_key(ppid));

        self.processes = new_processes;
        self.prev_cpu_times = new_cpu_times;
        self.prev_total_cpu_time = new_total_cpu_time;
        self.total_cpu_time = new_total_cpu_time;
        self.last_refresh = Instant::now();

        Ok(())
    }

    /// Read process information from /proc/[pid]
    fn read_process_info(&self, pid: u32) -> io::Result<ProcessInfo> {
        let proc_path = self.proc_path();
        let pid_path = proc_path.join(pid.to_string());

        // Read /proc/[pid]/comm
        let name = fs::read_to_string(pid_path.join("comm"))
            .map(|s| s.trim().to_string())
            .unwrap_or_else(|_| "unknown".to_string());

        // Read /proc/[pid]/cmdline
        let cmdline = fs::read_to_string(pid_path.join("cmdline"))
            .map(|s| s.replace('\0', " ").trim().to_string())
            .unwrap_or_else(|_| name.clone());

        // Read /proc/[pid]/stat
        let stat_content = fs::read_to_string(pid_path.join("stat"))?;
        let stat_parts: Vec<&str> = stat_content.split_whitespace().collect();

        // Parse stat fields (see `man proc` for field indices)
        let state = stat_parts.get(2)
            .and_then(|s| s.chars().next())
            .unwrap_or('?');
        let ppid = stat_parts.get(3)
            .and_then(|s| s.parse().ok())
            .unwrap_or(0);
        let utime = stat_parts.get(13)
            .and_then(|s| s.parse().ok())
            .unwrap_or(0);
        let stime = stat_parts.get(14)
            .and_then(|s| s.parse().ok())
            .unwrap_or(0);
        let num_threads = stat_parts.get(19)
            .and_then(|s| s.parse().ok())
            .unwrap_or(1);
        let starttime = stat_parts.get(21)
            .and_then(|s| s.parse().ok())
            .unwrap_or(0);

        // Read /proc/[pid]/statm for memory
        let statm_content = fs::read_to_string(pid_path.join("statm"))
            .unwrap_or_default();
        let statm_parts: Vec<&str> = statm_content.split_whitespace().collect();
        let memory_pages: u64 = statm_parts.get(1) // RSS
            .and_then(|s| s.parse().ok())
            .unwrap_or(0);
        let memory_kb = memory_pages * 4; // Page size is typically 4KB

        Ok(ProcessInfo {
            pid,
            name,
            cmdline,
            state,
            cpu_percent: 0.0,
            memory_kb,
            memory_percent: 0.0,
            ppid,
            num_threads,
            utime,
            stime,
            starttime,
        })
    }

    /// Read total CPU time from /proc/stat
    fn read_total_cpu_time(&self) -> io::Result<u64> {
        let stat_path = self.proc_path().join("stat");
        let content = fs::read_to_string(stat_path)?;
        
        if let Some(cpu_line) = content.lines().next() {
            let parts: Vec<&str> = cpu_line.split_whitespace().collect();
            // Sum all CPU time fields (user, nice, system, idle, iowait, irq, softirq)
            let total: u64 = parts.iter()
                .skip(1)  // Skip "cpu" label
                .take(7)
                .filter_map(|s| s.parse::<u64>().ok())
                .sum();
            return Ok(total);
        }

        Ok(0)
    }

    /// Read total memory from /proc/meminfo
    fn read_total_memory() -> io::Result<u64> {
        let content = fs::read_to_string("/proc/meminfo")?;
        
        for line in content.lines() {
            if line.starts_with("MemTotal:") {
                let parts: Vec<&str> = line.split_whitespace().collect();
                if let Some(kb_str) = parts.get(1) {
                    if let Ok(kb) = kb_str.parse::<u64>() {
                        return Ok(kb);
                    }
                }
            }
        }

        Ok(0)
    }

    /// Calculate tile position for a process (clustered by PPID)
    fn calculate_tile_position(&self, pid: u32, ppid: u32) -> (f32, f32) {
        let center = self.cluster_centers.get(&ppid).copied().unwrap_or((0.0, 0.0));
        
        // Offset children from parent center using a smaller spiral
        let golden_angle = std::f32::consts::PI * (3.0 - 5.0_f32.sqrt());
        let index = pid as f32; // Use PID as stable seed for offset
        let radius = 100.0 + (index % 10.0) * 20.0;
        let theta = index * golden_angle;
        
        let x = center.0 + radius * theta.cos();
        let y = center.1 + radius * theta.sin();
        
        (x, y)
    }

    /// Generate a semi-random cluster center far from existing ones
    fn generate_random_cluster_center(&self) -> (f32, f32) {
        let index = self.cluster_centers.len() as f32;
        let radius = 500.0 * (index + 1.0).sqrt();
        let theta = index * 2.4; // Fixed step angle
        
        (radius * theta.cos(), radius * theta.sin())
    }

    /// Get all processes
    pub fn processes(&self) -> &HashMap<u32, ProcessInfo> {
        &self.processes
    }

    /// Get process count
    pub fn count(&self) -> usize {
        self.processes.len()
    }

    /// Get tile position for a process
    pub fn get_tile_position(&self, pid: u32) -> Option<(f32, f32)> {
        self.tile_positions.get(&pid).copied()
    }

    /// Get processes sorted by CPU usage
    pub fn top_by_cpu(&self, limit: usize) -> Vec<&ProcessInfo> {
        let mut sorted: Vec<_> = self.processes.values().collect();
        sorted.sort_by(|a, b| b.cpu_percent.partial_cmp(&a.cpu_percent).unwrap_or(std::cmp::Ordering::Equal));
        sorted.into_iter().take(limit).collect()
    }

    /// Get processes sorted by memory usage
    pub fn top_by_memory(&self, limit: usize) -> Vec<&ProcessInfo> {
        let mut sorted: Vec<_> = self.processes.values().collect();
        sorted.sort_by(|a, b| b.memory_kb.cmp(&a.memory_kb));
        sorted.into_iter().take(limit).collect()
    }

    /// Get rendering data for all process tiles
    pub fn get_render_data(&self) -> Vec<ProcessTileRenderData> {
        self.processes.values()
            .filter_map(|process| {
                let position = self.tile_positions.get(&process.pid)?;
                Some(ProcessTileRenderData {
                    pid: process.pid,
                    name: process.name.clone(),
                    position: *position,
                    size: process.memory_to_size(),
                    brightness: process.cpu_to_brightness(),
                    color: process.semantic_color(),
                    state: process.state,
                    cpu_percent: process.cpu_percent,
                    memory_percent: process.memory_percent,
                })
            })
            .collect()
    }
}

impl Default for ProcessTileManager {
    fn default() -> Self {
        Self::new()
    }
}

/// Render data for a single process tile
#[derive(Debug, Clone)]
pub struct ProcessTileRenderData {
    pub pid: u32,
    pub name: String,
    pub position: (f32, f32),
    pub size: f32,
    pub brightness: f32,
    pub color: [f32; 4],
    pub state: char,
    pub cpu_percent: f32,
    pub memory_percent: f32,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_process_tile_manager() {
        let mut manager = ProcessTileManager::new();
        
        // This test only works on Linux
        if cfg!(target_os = "linux") {
            manager.refresh().expect("Failed to refresh process list");
            
            // Should have at least the current process
            assert!(manager.count() > 0, "Should have at least one process");
            
            // Get render data
            let render_data = manager.get_render_data();
            assert!(!render_data.is_empty(), "Should have render data");
            
            // Check that our process is in the list
            let our_pid = std::process::id();
            assert!(manager.processes().contains_key(&our_pid), "Should contain our process");
        }
    }

    #[test]
    fn test_semantic_colors() {
        let process = ProcessInfo {
            pid: 1,
            name: "rustc".to_string(),
            cmdline: "rustc --version".to_string(),
            state: 'R',
            cpu_percent: 50.0,
            memory_kb: 100000,
            memory_percent: 1.0,
            ppid: 0,
            num_threads: 1,
            utime: 0,
            stime: 0,
            starttime: 0,
        };

        // Rust should be cyan
        let color = process.semantic_color();
        assert!(color[1] > color[0], "Rust should have more green/cyan");
    }
}
