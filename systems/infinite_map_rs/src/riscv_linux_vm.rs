// ============================================================================
// RISC-V Linux VM Integration for Infinite Map Compositor
//
// This module provides a high-level interface to the RISC-V Linux VM shader,
// handling initialization, execution, and ACE-RTS integration.
//
// Features:
// - Load and execute RISC-V Linux kernels
// - MMU management and page table setup
// - MMIO peripheral handling (UART console, timers)
// - SBI (Supervisor Binary Interface) proxy
// - ACE-RTS integration for cognitive BIOS functionality
// ============================================================================

use std::sync::Arc;
use bytemuck::{Pod, Zeroable};
use wgpu::util::DeviceExt;

// ============================================================================
// CONSTANTS
// ============================================================================

pub const RAM_BASE: u32 = 0x80000000;
pub const RAM_SIZE: u32 = 0x10000000; // 256MB default
pub const PAGE_SIZE: u32 = 4096;

pub const UART_BASE: u32 = 0x10000000;
pub const CLINT_BASE: u32 = 0x02000000;
pub const PLIC_BASE: u32 = 0x0C000000;

pub const SBI_SUCCESS: i64 = 0;
pub const SBI_ERR_FAILED: i64 = -1;
pub const SBI_ERR_NOT_SUPPORTED: i64 = -2;
pub const SBI_ERR_INVALID_PARAM: i64 = -3;
pub const SBI_ERR_DENIED: i64 = -4;
pub const SBI_ERR_INVALID_ADDRESS: i64 = -5;
pub const SBI_ERR_ALREADY_AVAILABLE: i64 = -6;

// SBI Extension IDs
pub const SBI_EXT_BASE: u64 = 0x10;
pub const SBI_EXT_TIME: u64 = 0x54494D45;
pub const SBI_EXT_IPI: u64 = 0x735049;
pub const SBI_EXT_RFENCE: u64 = 0x52464E43;
pub const SBI_EXT_HSM: u64 = 0x48534D;
pub const SBI_EXT_SRST: u64 = 0x53525354;

// ============================================================================
// DATA STRUCTURES (must match WGSL layout)
// ============================================================================

#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
pub struct ExecutionState {
    pub running: u32,
    pub exit_code: u32,
    pub instruction_count: u32,
    pub cycle_count: u32,
    pub privilege: u32,
    pub satp: u32,
    pub pending_interrupt: u32,
    pub trap_pending: u32,
}

#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
pub struct CSRBank {
    // Machine CSRs
    pub mstatus: u32,
    pub misa: u32,
    pub medeleg: u32,
    pub mideleg: u32,
    pub mie: u32,
    pub mtvec: u32,
    pub mcounteren: u32,
    pub mscratch: u32,
    pub mepc: u32,
    pub mcause: u32,
    pub mtval: u32,
    pub mip: u32,
    // Machine counters
    pub mcycle: u32,
    pub mcycleh: u32,
    pub minstret: u32,
    pub minstreth: u32,
    // Supervisor CSRs
    pub sstatus: u32,
    pub sie: u32,
    pub stvec: u32,
    pub scounteren: u32,
    pub sscratch: u32,
    pub sepc: u32,
    pub scause: u32,
    pub stval: u32,
    pub sip: u32,
}

#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
pub struct MMIOState {
    // UART
    pub uart_thr: u32,
    pub uart_rbr: u32,
    pub uart_ier: u32,
    pub uart_iir: u32,
    pub uart_fcr: u32,
    pub uart_lcr: u32,
    pub uart_mcr: u32,
    pub uart_lsr: u32,
    pub uart_msr: u32,
    pub uart_scr: u32,
    pub uart_dll: u32,
    pub uart_dlh: u32,
    pub uart_tx_ready: u32,
    pub uart_rx_ready: u32,
    // CLINT
    pub clint_mtime: u32,
    pub clint_mtimeh: u32,
    pub clint_mtimecmp: u32,
    pub clint_mtimecmph: u32,
    pub clint_msip: u32,
}

#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
pub struct VMConfig {
    pub texture_width: u32,
    pub texture_height: u32,
    pub memory_size: u32,
    pub enable_mmu: u32,
    pub enable_trace: u32,
    pub reserved: u32,
}

#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
pub struct SBIRequest {
    pub extension: u64,
    pub function: u64,
    pub args: [u64; 6],
}

#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
pub struct SBIResponse {
    pub error: i64,
    pub value: i64,
}

// ============================================================================
// RISC-V LINUX VM
// ============================================================================

pub struct RiscVLinuxVM {
    device: Arc<wgpu::Device>,
    queue: Arc<wgpu::Queue>,
    
    // GPU Resources
    pub memory_buffer: wgpu::Buffer,
    pub registers_buffer: wgpu::Buffer,
    pub pc_buffer: wgpu::Buffer,
    pub state_buffer: wgpu::Buffer,
    pub csr_buffer: wgpu::Buffer,
    pub mmio_buffer: wgpu::Buffer,
    pub stats_buffer: wgpu::Buffer,
    pub config_buffer: wgpu::Buffer,
    
    // Pipelines
    init_pipeline: wgpu::ComputePipeline,
    execute_pipeline: wgpu::ComputePipeline,
    
    // Bind groups
    bind_group: wgpu::BindGroup,
    bind_group_layout: wgpu::BindGroupLayout,
    
    // Configuration
    config: VMConfig,
    
    // Runtime state
    pub instruction_count: u64,
    pub console_output: Vec<u8>,
    
    // ACE-RTS callbacks
    pub uart_handler: Option<Box<dyn Fn(u8) + Send + Sync>>,
    pub sbi_handler: Option<Box<dyn Fn(SBIRequest) -> SBIResponse + Send + Sync>>,
}

impl RiscVLinuxVM {
    /// Create a new RISC-V Linux VM with the specified memory size
    pub fn new(
        device: Arc<wgpu::Device>,
        queue: Arc<wgpu::Queue>,
        memory_size: u32,
    ) -> Self {
        let memory_words = (memory_size / 4) as usize;
        
        // Create memory buffer
        let memory_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V VM Memory"),
            size: (memory_words * 4) as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        
        // Create registers buffer (32 x 4 bytes)
        let registers_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V VM Registers"),
            size: 128, // 32 * 4
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        
        // Create PC buffer
        let pc_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("RISC-V VM PC"),
            contents: bytemuck::cast_slice(&[RAM_BASE]),
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
        });
        
        // Create state buffer
        let state_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V VM State"),
            size: std::mem::size_of::<ExecutionState>() as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        
        // Create CSR buffer
        let csr_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V VM CSRs"),
            size: std::mem::size_of::<CSRBank>() as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        
        // Create MMIO buffer
        let mmio_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V VM MMIO"),
            size: std::mem::size_of::<MMIOState>() as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        
        // Create stats buffer (for host communication)
        let stats_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V VM Stats"),
            size: 256, // 64 u32s
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        
        // Create config
        let config = VMConfig {
            texture_width: 256,
            texture_height: 256,
            memory_size,
            enable_mmu: 0,
            enable_trace: 0,
            reserved: 0,
        };
        
        let config_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("RISC-V VM Config"),
            contents: bytemuck::bytes_of(&config),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });
        
        // Load shader module
        let shader_module = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("RISC-V Linux VM Shader"),
            source: wgpu::ShaderSource::Wgsl(
                include_str!("shaders/riscv_linux_vm.wgsl").into()
            ),
        });
        
        // Create bind group layout
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("RISC-V VM Bind Group Layout"),
            entries: &[
                // RAM buffer (replaces texture for better compatibility)
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Registers
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Memory
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // PC
                wgpu::BindGroupLayoutEntry {
                    binding: 3,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // State
                wgpu::BindGroupLayoutEntry {
                    binding: 4,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // CSRs
                wgpu::BindGroupLayoutEntry {
                    binding: 5,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // MMIO
                wgpu::BindGroupLayoutEntry {
                    binding: 6,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Stats
                wgpu::BindGroupLayoutEntry {
                    binding: 7,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Config
                wgpu::BindGroupLayoutEntry {
                    binding: 8,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });
        
        // Create bind group
        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("RISC-V VM Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: memory_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: registers_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: memory_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: pc_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 4,
                    resource: state_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 5,
                    resource: csr_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 6,
                    resource: mmio_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 7,
                    resource: stats_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 8,
                    resource: config_buffer.as_entire_binding(),
                },
            ],
        });
        
        // Create pipeline layout
        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("RISC-V VM Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });
        
        // Create pipelines
        let init_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("RISC-V VM Init Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader_module,
            entry_point: "init",
        });
        
        let execute_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("RISC-V VM Execute Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader_module,
            entry_point: "main",
        });
        
        Self {
            device,
            queue,
            memory_buffer,
            registers_buffer,
            pc_buffer,
            state_buffer,
            csr_buffer,
            mmio_buffer,
            stats_buffer,
            config_buffer,
            init_pipeline,
            execute_pipeline,
            bind_group,
            bind_group_layout,
            config,
            instruction_count: 0,
            console_output: Vec::new(),
            uart_handler: None,
            sbi_handler: None,
        }
    }
    
    /// Initialize the VM (reset all state)
    pub fn initialize(&mut self) {
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("RISC-V VM Initialize"),
        });
        
        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("RISC-V VM Init Pass"),
                timestamp_writes: None,
            });
            
            compute_pass.set_pipeline(&self.init_pipeline);
            compute_pass.set_bind_group(0, &self.bind_group, &[]);
            compute_pass.dispatch_workgroups(1, 1, 1);
        }
        
        self.queue.submit(Some(encoder.finish()));
        self.instruction_count = 0;
        self.console_output.clear();
    }
    
    /// Load a binary into VM memory at the specified address
    pub fn write_memory(&mut self, addr: u32, data: &[u8]) {
        if data.is_empty() { return; }
        let offset = addr.saturating_sub(RAM_BASE) as u64;
        
        // wgpu requires 4-byte alignment for write_buffer
        if data.len() % 4 == 0 {
            self.queue.write_buffer(&self.memory_buffer, offset, data);
        } else {
            let mut padded = data.to_vec();
            while padded.len() % 4 != 0 {
                padded.push(0);
            }
            self.queue.write_buffer(&self.memory_buffer, offset, &padded);
        }
    }
    
    /// Load a Linux kernel (assumes binary at RAM_BASE)
    pub fn load_kernel(&mut self, kernel: &[u8]) {
        self.write_memory(RAM_BASE, kernel);
    }
    
    /// Load a device tree blob (DTB)
    pub fn load_dtb(&mut self, dtb: &[u8], addr: u32) {
        self.write_memory(addr, dtb);
    }
    
    /// Execute a single instruction
    pub fn step(&mut self) {
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("RISC-V VM Step"),
        });
        
        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("RISC-V VM Execute Pass"),
                timestamp_writes: None,
            });
            
            compute_pass.set_pipeline(&self.execute_pipeline);
            compute_pass.set_bind_group(0, &self.bind_group, &[]);
            compute_pass.dispatch_workgroups(1, 1, 1);
        }
        
        self.queue.submit(Some(encoder.finish()));
        self.instruction_count += 1;
    }
    
    /// Execute multiple instructions
    pub fn run(&mut self, instructions: u32) {
        for _ in 0..instructions {
            self.step();
        }
    }
    
    /// Read the current execution state
    pub fn read_state(&self) -> ExecutionState {
        let buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("State Readback"),
            size: std::mem::size_of::<ExecutionState>() as u64,
            usage: wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::MAP_READ,
            mapped_at_creation: false,
        });
        
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("State Readback Encoder"),
        });
        
        encoder.copy_buffer_to_buffer(
            &self.state_buffer,
            0,
            &buffer,
            0,
            std::mem::size_of::<ExecutionState>() as u64,
        );
        
        self.queue.submit(Some(encoder.finish()));
        
        // Map and read
        let slice = buffer.slice(..);
        slice.map_async(wgpu::MapMode::Read, |_| {});
        self.device.poll(wgpu::Maintain::Wait);
        
        let data = slice.get_mapped_range();
        let state: ExecutionState = *bytemuck::from_bytes(&data);
        drop(data);
        buffer.unmap();
        
        state
    }
    
    /// Read the current PC
    pub fn read_pc(&self) -> u32 {
        let buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("PC Readback"),
            size: 4,
            usage: wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::MAP_READ,
            mapped_at_creation: false,
        });
        
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("PC Readback Encoder"),
        });
        
        encoder.copy_buffer_to_buffer(&self.pc_buffer, 0, &buffer, 0, 4);
        self.queue.submit(Some(encoder.finish()));
        
        let slice = buffer.slice(..);
        slice.map_async(wgpu::MapMode::Read, |_| {});
        self.device.poll(wgpu::Maintain::Wait);
        
        let data = slice.get_mapped_range();
        let pc: u32 = *bytemuck::from_bytes(&data);
        drop(data);
        buffer.unmap();
        
        pc
    }
    
    /// Read memory from the VM
    pub fn read_memory(&self, addr: u32, size: u32) -> Vec<u8> {
        let offset = addr.saturating_sub(RAM_BASE) as u64;
        let buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Memory Readback"),
            size: size as u64,
            usage: wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::MAP_READ,
            mapped_at_creation: false,
        });
        
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Memory Readback Encoder"),
        });
        
        encoder.copy_buffer_to_buffer(&self.memory_buffer, offset, &buffer, 0, size as u64);
        self.queue.submit(Some(encoder.finish()));
        
        let slice = buffer.slice(..);
        slice.map_async(wgpu::MapMode::Read, |_| {});
        self.device.poll(wgpu::Maintain::Wait);
        
        let data = slice.get_mapped_range();
        let result: Vec<u8> = data.to_vec();
        drop(data);
        buffer.unmap();
        
        result
    }
    
    /// Read stats buffer (for host communication)
    pub fn read_stats(&self) -> Vec<u32> {
        let buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Stats Readback"),
            size: 256,
            usage: wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::MAP_READ,
            mapped_at_creation: false,
        });
        
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Stats Readback Encoder"),
        });
        
        encoder.copy_buffer_to_buffer(&self.stats_buffer, 0, &buffer, 0, 256);
        self.queue.submit(Some(encoder.finish()));
        
        let slice = buffer.slice(..);
        slice.map_async(wgpu::MapMode::Read, |_| {});
        self.device.poll(wgpu::Maintain::Wait);
        
        let data = slice.get_mapped_range();
        let result: Vec<u32> = data
            .chunks_exact(4)
            .map(|b| u32::from_le_bytes([b[0], b[1], b[2], b[3]]))
            .collect();
        drop(data);
        buffer.unmap();
        
        result
    }
    
    /// Check for UART output and handle it
    pub fn poll_uart(&mut self) {
        let stats = self.read_stats();
        
        // Check for UART output in stats[0]
        if stats[0] != 0 {
            let byte = (stats[0] & 0xFF) as u8;
            self.console_output.push(byte);
            
            // Call handler if set
            if let Some(handler) = &self.uart_handler {
                handler(byte);
            }
            
            // Clear the stats
            self.queue.write_buffer(&self.stats_buffer, 0, &[0u8; 4]);
        }
    }
    
    /// Set the SATP register (enable/disable MMU)
    pub fn set_satp(&mut self, satp: u32) {
        self.config.enable_mmu = if satp & 0x80000000 != 0 { 1 } else { 0 };
        
        // Update config buffer
        self.queue.write_buffer(
            &self.config_buffer,
            12, // offset of enable_mmu
            &self.config.enable_mmu.to_le_bytes(),
        );
    }
    
    /// Create a simple page table for identity mapping
    pub fn setup_identity_mapping(&mut self) {
        // This is a simplified implementation
        // In practice, you'd build proper Sv32 page tables
        
        // For now, we just disable the MMU
        self.set_satp(0);
    }
    
    /// Set up device tree blob in memory
    pub fn setup_dtb(&mut self, memory_size: u64, boot_args: &str) -> u32 {
        // DTB base address (typically at end of RAM or reserved area)
        let dtb_addr = RAM_BASE + memory_size as u32 - 0x10000;
        
        // Simple device tree for RISC-V Linux
        // In production, use a proper DTB generator
        let dtb = Self::generate_simple_dtb(memory_size, boot_args);
        self.load_dtb(&dtb, dtb_addr);
        
        dtb_addr
    }
    
    /// Generate a simple device tree blob
    pub fn generate_simple_dtb(memory_size: u64, boot_args: &str) -> Vec<u8> {
        // This is a simplified placeholder
        // In production, use the `fdt` crate or similar
        
        // For now, return an empty DTB (Linux will use default config)
        // A real implementation would generate a proper DTB with:
        // - /memory node
        // - /cpus node
        // - /soc node with UART, CLINT, PLIC
        // - /chosen node with bootargs
        
        vec![0xd0, 0x0d, 0xfe, 0xed, // magic
             0x00, 0x00, 0x00, 0x48, // totalsize
             0x00, 0x00, 0x00, 0x38, // off_dt_struct
             0x00, 0x00, 0x00, 0x44, // off_dt_strings
             0x00, 0x00, 0x00, 0x28, // off_mem_rsvmap
             0x00, 0x00, 0x00, 0x11, // version
             0x00, 0x00, 0x00, 0x10, // last_comp_version
             0x00, 0x00, 0x00, 0x00, // boot_cpuid_phys
             0x00, 0x00, 0x00, 0x0c, // size_dt_strings
             0x00, 0x00, 0x00, 0x0c, // size_dt_struct
             // Memory reservation map (empty)
             0x00, 0x00, 0x00, 0x00,
             0x00, 0x00, 0x00, 0x00,
             // Structure
             0x00, 0x00, 0x00, 0x01, // FDT_BEGIN_NODE
             0x00, // name (empty = root)
             0x00, 0x00, 0x00, 0x03, // FDT_PROP
             0x00, 0x00, 0x00, 0x00, // len
             0x00, 0x00, 0x00, 0x00, // nameoff
             0x00, 0x00, 0x00, 0x02, // FDT_END_NODE
             0x00, 0x00, 0x00, 0x09, // FDT_END
             // Strings (empty)
        ]
    }
}

// ============================================================================
// SBI (SUPERVISOR BINARY INTERFACE) HANDLER
// ============================================================================

pub struct SBIHandler {
    vm: Arc<std::sync::Mutex<RiscVLinuxVM>>,
}

impl SBIHandler {
    pub fn new(vm: Arc<std::sync::Mutex<RiscVLinuxVM>>) -> Self {
        Self { vm }
    }
    
    /// Handle an SBI call
    pub fn handle_call(&self, req: SBIRequest) -> SBIResponse {
        match req.extension {
            SBI_EXT_BASE => self.handle_base_extension(req.function, &req.args),
            SBI_EXT_TIME => self.handle_time_extension(req.function, &req.args),
            SBI_EXT_IPI => self.handle_ipi_extension(req.function, &req.args),
            SBI_EXT_SRST => self.handle_srst_extension(req.function, &req.args),
            SBI_EXT_HSM => SBIResponse {
                error: SBI_SUCCESS, // Stub HSM for single hart
                value: 0,
            },
            _ => {
                log::warn!("⚠️ Unsupported SBI extension: 0x{:x}", req.extension);
                SBIResponse {
                    error: SBI_ERR_NOT_SUPPORTED,
                    value: 0,
                }
            }
        }
    }
    
    fn handle_base_extension(&self, function: u64, _args: &[u64; 6]) -> SBIResponse {
        match function {
            0 => SBIResponse {
                error: SBI_SUCCESS,
                value: 0x10, // SBI spec version 0.1
            },
            1 => SBIResponse {
                error: SBI_SUCCESS,
                value: 0, // Implementation ID
            },
            2 => SBIResponse {
                error: SBI_SUCCESS,
                value: 1, // Implementation version
            },
            3 => SBIResponse {
                error: SBI_SUCCESS,
                value: 0, // Probing extension (not supported)
            },
            _ => SBIResponse {
                error: SBI_ERR_NOT_SUPPORTED,
                value: 0,
            },
        }
    }
    
    fn handle_time_extension(&self, function: u64, args: &[u64; 6]) -> SBIResponse {
        match function {
            0 => {
                // Set timer
                // args[0] = stime_value
                // In a real implementation, this would program the timer
                SBIResponse {
                    error: SBI_SUCCESS,
                    value: 0,
                }
            }
            _ => SBIResponse {
                error: SBI_ERR_NOT_SUPPORTED,
                value: 0,
            },
        }
    }
    
    fn handle_ipi_extension(&self, _function: u64, _args: &[u64; 6]) -> SBIResponse {
        // IPI (Inter-Processor Interrupt) - not implemented for single hart
        SBIResponse {
            error: SBI_ERR_NOT_SUPPORTED,
            value: 0,
        }
    }
    
    fn handle_srst_extension(&self, function: u64, args: &[u64; 6]) -> SBIResponse {
        match function {
            0 => {
                // System reset
                let reset_type = args[0];
                let reset_reason = args[1];
                
                // In a real implementation, this would trigger system reset
                log::info!("SBI system reset requested: type={}, reason={}", reset_type, reset_reason);
                
                SBIResponse {
                    error: SBI_SUCCESS,
                    value: 0,
                }
            }
            _ => SBIResponse {
                error: SBI_ERR_NOT_SUPPORTED,
                value: 0,
            },
        }
    }
}

// ============================================================================
// ACE-RTS COGNITIVE BIOS AGENT
// ============================================================================

pub struct CognitiveBIOS {
    vm: Arc<std::sync::Mutex<RiscVLinuxVM>>,
    console_buffer: Arc<std::sync::Mutex<Vec<u8>>>,
    sbi_handler: SBIHandler,
}

impl CognitiveBIOS {
    pub fn new(vm: Arc<std::sync::Mutex<RiscVLinuxVM>>) -> Self {
        let console_buffer = Arc::new(std::sync::Mutex::new(Vec::new()));
        let sbi_handler = SBIHandler::new(vm.clone());
        
        // Set up UART handler
        {
            let mut vm_lock = vm.lock().unwrap();
            let buffer = console_buffer.clone();
            
            vm_lock.uart_handler = Some(Box::new(move |byte| {
                let mut buf = buffer.lock().unwrap();
                buf.push(byte);
                
                // Print to host console
                print!("{}", byte as char);
                
                // Check for special sequences
                if byte == b'\n' {
                    let line: String = buf.drain(..).map(|b| b as char).collect();
                    log::info!("[Linux Console] {}", line.trim());
                }
            }));
        }
        
        Self {
            vm,
            console_buffer,
            sbi_handler,
        }
    }
    
    /// Run the BIOS main loop
    pub async fn run(&self) {
        let mut interval = tokio::time::interval(tokio::time::Duration::from_millis(10));
        
        loop {
            interval.tick().await;
            
            // Poll for UART output
            {
                let mut vm = self.vm.lock().unwrap();
                vm.poll_uart();
            }
            
            // Check for SBI calls via shared memory
            // In a real implementation, this would check a specific MMIO region
            
            // Check for kernel panics
            self.detect_kernel_panic();
        }
    }
    
    /// Detect kernel panic by analyzing console output
    fn detect_kernel_panic(&self) {
        let console = {
            let buf = self.console_buffer.lock().unwrap();
            String::from_utf8_lossy(&buf).to_string()
        };
        
        if console.contains("Kernel panic") {
            log::error!("KERNEL PANIC DETECTED!");
            
            // Capture diagnostic information
            let vm = self.vm.lock().unwrap();
            let pc = vm.read_pc();
            let state = vm.read_state();
            
            log::error!("PC: 0x{:08x}", pc);
            log::error!("Privilege: {}", state.privilege);
            log::error!("Instruction count: {}", state.instruction_count);
            
            // Could trigger automatic debugging here
        }
    }
    
    /// Generate a Device Tree Blob dynamically based on system state
    pub fn generate_device_tree(&self, memory_size: u64) -> Vec<u8> {
        // This would generate a proper FDT based on:
        // - Available memory
        // - CPU configuration
        // - MMIO devices
        // - Boot arguments
        
        RiscVLinuxVM::generate_simple_dtb(memory_size, "console=ttyS0,115200")
    }
    
    /// Live memory forensics
    pub fn analyze_memory(&self, addr: u32, size: u32) -> String {
        let vm = self.vm.lock().unwrap();
        let data = vm.read_memory(addr, size);
        
        // Generate hex dump
        let mut output = format!("Memory at 0x{:08x} ({} bytes):\n", addr, size);
        for (i, chunk) in data.chunks(16).enumerate() {
            output.push_str(&format!("{:08x}: ", addr + (i * 16) as u32));
            
            for byte in chunk {
                output.push_str(&format!("{:02x} ", byte));
            }
            
            for _ in chunk.len()..16 {
                output.push_str("   ");
            }
            
            output.push_str(" |");
            for byte in chunk {
                let c = *byte as char;
                if c.is_ascii_graphic() || c == ' ' {
                    output.push(c);
                } else {
                    output.push('.');
                }
            }
            output.push_str("|\n");
        }
        
        output
    }
}

// ============================================================================
// UTILITIES
// ============================================================================

/// Convert a physical address to a memory buffer offset
pub fn phys_to_offset(addr: u32) -> Option<u64> {
    if addr >= RAM_BASE && addr < RAM_BASE + RAM_SIZE {
        Some((addr - RAM_BASE) as u64)
    } else {
        None
    }
}

/// Align address to page boundary
pub fn page_align(addr: u32) -> u32 {
    (addr + PAGE_SIZE - 1) & !(PAGE_SIZE - 1)
}

/// Create a simple Sv32 page table entry
pub fn make_pte(ppn: u32, flags: u32) -> u32 {
    (ppn << 10) | (flags & 0x3FF) | 1 // Valid bit
}
