// ============================================================================
// Multi-VM Manager - Parallel RISC-V Linux Execution
//
// This module manages multiple RISC-V VM instances running in parallel on GPU.
//
// Phase 43 Design:
// - Up to 8 VMs can run concurrently (vm_id 0-7)
// - Each VM has independent syscall queues
// - Shared pending_counts and vm_status buffers for coordination
// ============================================================================

use std::sync::Arc;
use std::collections::HashMap;

use crate::riscv_executor::RiscvExecutor;

/// Configuration for a single VM instance
#[derive(Clone, Debug)]
pub struct VmInstanceConfig {
    /// Unique VM ID (0-7)
    pub vm_id: u32,

    /// Path to kernel binary
    pub kernel_path: Option<String>,

    /// VM display name
    pub name: String,
}

impl VmInstanceConfig {
    /// Create a new VM instance config
    pub fn new(vm_id: u32, kernel_path: Option<String>, name: String) -> Self {
        Self { vm_id, kernel_path, name }
    }

    /// Create a config using the default test kernel
    pub fn with_test_kernel(vm_id: u32, name: String) -> Self {
        Self {
            vm_id,
            kernel_path: Some("tests/hello_syscall.bin".to_string()),
            name,
        }
    }
}

/// State of a VM instance
#[derive(Clone, Debug, PartialEq)]
pub enum VmInstanceState {
    Stopped,
    Booting,
    Running,
    Exited(i32), // Exit code
    Error(String),
}

/// Multi-VM Manager - runs multiple VMs in parallel
pub struct MultiVmManager {
    /// GPU device
    device: Arc<wgpu::Device>,

    /// GPU queue
    queue: Arc<wgpu::Queue>,

    /// VM instances (vm_id -> executor)
    instances: HashMap<u32, VmInstance>,

    /// Maximum concurrent VMs
    max_vms: usize,
}

/// A single VM instance managed by MultiVmManager
pub struct VmInstance {
    /// VM configuration
    config: VmInstanceConfig,

    /// RISC-V executor (with specific vm_id)
    executor: RiscvExecutor,

    /// Current state
    state: VmInstanceState,

    /// Console output buffer
    console_output: String,

    /// Execution statistics
    instruction_count: u64,
    syscall_count: u64,
}

impl MultiVmManager {
    /// Create a new Multi-VM manager
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>) -> Self {
        Self {
            device,
            queue,
            instances: HashMap::new(),
            max_vms: 8, // Phase 43 design: 8 concurrent VMs
        }
    }

    /// Launch multiple VM instances in parallel
    pub fn launch_multiple(&mut self, configs: Vec<VmInstanceConfig>) -> Result<(), String> {
        // Check we don't exceed max VMs
        if configs.len() > self.max_vms {
            return Err(format!(
                "Cannot launch {} VMs (max: {})",
                configs.len(),
                self.max_vms
            ));
        }

        // Check for duplicate vm_ids
        let mut vm_ids = std::collections::HashSet::new();
        for config in &configs {
            if !vm_ids.insert(config.vm_id) {
                return Err(format!("Duplicate vm_id: {}", config.vm_id));
            }
            if config.vm_id >= self.max_vms as u32 {
                return Err(format!("Invalid vm_id: {} (must be 0-{})", config.vm_id, self.max_vms - 1));
            }
        }

        // Launch each VM
        for config in configs {
            self.launch_vm(config)?;
        }

        log::info!("Launched {} VM instances in parallel", self.instances.len());
        Ok(())
    }

    /// Launch a single VM instance
    fn launch_vm(&mut self, config: VmInstanceConfig) -> Result<(), String> {
        log::info!("Launching VM {}: {}", config.vm_id, config.name);

        // Create executor with specific vm_id
        let mut executor = RiscvExecutor::new(
            self.device.clone(),
            self.queue.clone(),
        );

        // Set VM ID in executor
        executor.set_vm_id(config.vm_id);

        // Load kernel if specified
        if let Some(kernel_path) = &config.kernel_path {
            self.load_kernel(&mut executor, kernel_path)?;
        }

        // Create instance
        let instance = VmInstance {
            config: config.clone(),
            executor,
            state: VmInstanceState::Booting,
            console_output: String::new(),
            instruction_count: 0,
            syscall_count: 0,
        };

        self.instances.insert(config.vm_id, instance);

        Ok(())
    }

    /// Load a kernel into the executor
    fn load_kernel(&self, executor: &mut RiscvExecutor, kernel_path: &str) -> Result<(), String> {
        use std::fs;

        // Read kernel binary
        let kernel_data = fs::read(kernel_path)
            .map_err(|e| format!("Failed to read kernel: {}", e))?;

        // Load into executor memory at RAM_BASE (0x80000000)
        let _ = executor.load_binary(&kernel_data, 0x80000000);

        // Set PC to kernel entry point
        executor.set_pc(0x80000000);

        log::info!("Loaded kernel: {} ({} bytes)", kernel_path, kernel_data.len());
        Ok(())
    }

    /// Execute all VMs for one frame
    pub fn execute_frame(&mut self) {
        for (vm_id, instance) in &mut self.instances {
            if matches!(instance.state, VmInstanceState::Running | VmInstanceState::Booting) {
                instance.executor.execute_frame();

                // Update console output
                let output = instance.executor.get_console_output();
                if !output.is_empty() && output != instance.console_output {
                    instance.console_output = output.to_string();
                }

                // Update stats
                instance.instruction_count += 1; // Simplified - would get from executor

                // Check if still running
                if !instance.executor.is_running() {
                    instance.state = VmInstanceState::Exited(0);
                    log::info!("VM {} ({}) exited", vm_id, instance.config.name);
                } else if matches!(instance.state, VmInstanceState::Booting) {
                    instance.state = VmInstanceState::Running;
                }
            }
        }
    }

    /// Get console output from a specific VM
    pub fn get_console_output(&self, vm_id: u32) -> Option<&str> {
        self.instances.get(&vm_id).map(|vm| vm.console_output.as_str())
    }

    /// Get state of a specific VM
    pub fn get_vm_state(&self, vm_id: u32) -> Option<&VmInstanceState> {
        self.instances.get(&vm_id).map(|vm| &vm.state)
    }

    /// Get statistics for all VMs
    pub fn get_stats(&self) -> Vec<VmStats> {
        self.instances.values().map(|vm| VmStats {
            vm_id: vm.config.vm_id,
            name: vm.config.name.clone(),
            state: vm.state.clone(),
            instruction_count: vm.instruction_count,
            syscall_count: vm.syscall_count,
        }).collect()
    }

    /// Stop all VMs
    pub fn stop_all(&mut self) {
        for (vm_id, instance) in &mut self.instances {
            instance.executor.reset();
            instance.state = VmInstanceState::Stopped;
            log::info!("Stopped VM {}", vm_id);
        }
    }

    /// Get number of running VMs
    pub fn running_count(&self) -> usize {
        self.instances.values()
            .filter(|vm| matches!(vm.state, VmInstanceState::Running | VmInstanceState::Booting))
            .count()
    }

    /// Get total VM count
    pub fn total_count(&self) -> usize {
        self.instances.len()
    }
}

/// Statistics for a VM instance
#[derive(Clone, Debug)]
pub struct VmStats {
    pub vm_id: u32,
    pub name: String,
    pub state: VmInstanceState,
    pub instruction_count: u64,
    pub syscall_count: u64,
}
