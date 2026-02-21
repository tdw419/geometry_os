//! RISC-V GPU Memory Layout Module
//!
//! This module provides the memory layout structures and GPU buffer creation
//! for the RISC-V VM state.

use anyhow::Result;
use bytemuck::{Pod, Zeroable};
use wgpu::*;

pub const RAM_SIZE: u32 = 128 * 1024 * 1024; // 128MB (WebGPU limit is 128MB)
pub const REGISTER_COUNT: usize = 32;

/// Execution state of the RISC-V VM
///
/// This struct must match the layout in the WGSL shader.
#[repr(C)]
#[derive(Debug, Clone, Copy, Pod, Zeroable)]
pub struct ExecutionState {
    /// VM is running (1 = running, 0 = halted)
    pub running: u32,
    /// Exit code (0 = success)
    pub exit_code: u32,
    /// Number of instructions executed
    pub instruction_count: u32,
    /// Number of cycles elapsed
    pub cycle_count: u32,
    /// Current privilege level (0 = user, 1 = supervisor, 3 = machine)
    pub privilege: u32,
    /// SATP register (address translation and protection)
    pub satp: u32,
    /// Pending interrupt flag
    pub pending_interrupt: u32,
    /// Trap pending flag
    pub trap_pending: u32,
}

/// Control and Status Registers (CSRs)
///
/// This struct must match the layout in the WGSL shader.
#[repr(C)]
#[derive(Debug, Clone, Copy, Pod, Zeroable)]
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

/// Memory-Mapped I/O State
///
/// This struct must match the layout in the WGSL shader.
#[repr(C)]
#[derive(Debug, Clone, Copy, Pod, Zeroable)]
pub struct MMIOState {
    // UART 16550 registers
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
    // CLINT (Core Local Interruptor)
    pub clint_mtime: u32,
    pub clint_mtimeh: u32,
    pub clint_mtimecmp: u32,
    pub clint_mtimecmph: u32,
    pub clint_msip: u32,
}

/// VM configuration
///
/// This struct must match the layout in the WGSL shader.
#[repr(C)]
#[derive(Debug, Clone, Copy, Pod, Zeroable)]
pub struct Config {
    /// Texture width in pixels
    pub texture_width: u32,
    /// Texture height in pixels
    pub texture_height: u32,
    /// Total memory size in bytes
    pub memory_size: u32,
    /// Enable MMU (1 = enabled, 0 = disabled)
    pub enable_mmu: u32,
    /// Enable instruction tracing (1 = enabled, 0 = disabled)
    pub enable_trace: u32,
    /// Reserved for future use
    pub reserved: u32,
}

/// VM memory layout containing all GPU buffers
#[derive(Debug)]
pub struct VMMemoryLayout {
    // GPU buffers
    pub ram_buffer_binding: Buffer, // storage array for binding 0 (input program)
    pub ram_buffer: Buffer,         // storage array for binding 2 (working memory)
    pub registers_buffer: Buffer,
    pub pc_buffer: Buffer,
    pub state_buffer: Buffer,
    pub csrs_buffer: Buffer,
    pub mmio_buffer: Buffer,
    pub stats_buffer: Buffer,
    pub config_buffer: Buffer,

    // Bind group
    pub bind_group: BindGroup,
}

impl Default for CSRBank {
    fn default() -> Self {
        Self {
            mstatus: 0,
            misa: 0x40001105, // RV32IMA
            medeleg: 0,
            mideleg: 0,
            mie: 0,
            mtvec: 0,
            mcounteren: 0,
            mscratch: 0,
            mepc: 0,
            mcause: 0,
            mtval: 0,
            mip: 0,
            mcycle: 0,
            mcycleh: 0,
            minstret: 0,
            minstreth: 0,
            sstatus: 0,
            sie: 0,
            stvec: 0,
            scounteren: 0,
            sscratch: 0,
            sepc: 0,
            scause: 0,
            stval: 0,
            sip: 0,
        }
    }
}

impl Default for MMIOState {
    fn default() -> Self {
        Self {
            uart_thr: 0,
            uart_rbr: 0,
            uart_ier: 0,
            uart_iir: 0x01, // No interrupt pending
            uart_fcr: 0,
            uart_lcr: 0,
            uart_mcr: 0,
            uart_lsr: 0x60, // THRE and TEMT set (transmitter ready)
            uart_msr: 0x30, // CTS and DSR set
            uart_scr: 0,
            uart_dll: 0x0c, // Divisor latch low byte (115200 baud)
            uart_dlh: 0,
            uart_tx_ready: 0,
            uart_rx_ready: 0,
            clint_mtime: 0,
            clint_mtimeh: 0,
            clint_mtimecmp: 0xffffffff, // No timer interrupt
            clint_mtimecmph: 0xffffffff,
            clint_msip: 0,
        }
    }
}

impl Default for Config {
    fn default() -> Self {
        Self {
            texture_width: 16,
            texture_height: 16,
            memory_size: RAM_SIZE,
            enable_mmu: 0,
            enable_trace: 0,
            reserved: 0,
        }
    }
}

impl VMMemoryLayout {
    /// Create a new VM memory layout with GPU buffers
    ///
    /// # Arguments
    /// * `device` - The WGPU device
    /// * `queue` - The WGPU queue
    /// * `program` - The RISC-V program to load
    /// * `bind_group_layout` - The bind group layout for the VM shader
    pub fn new(
        device: &Device,
        queue: &Queue,
        program: &super::RiscvProgram,
        bind_group_layout: &BindGroupLayout,
    ) -> Result<Self> {
        use wgpu::BufferUsages;

        // Create RAM buffer (256MB)
        let ram_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("RISC-V RAM"),
            size: RAM_SIZE as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Initialize RAM with program code
        let code_bytes: Vec<u8> = program
            .code
            .iter()
            .flat_map(|&w| w.to_le_bytes().to_vec())
            .collect();

        // Create RAM buffer for binding 0 (input program)
        // Ensure size is at least as large as code_bytes and 4-byte aligned
        let ram_buffer_binding_size = (code_bytes.len() as u64 + 3) & !3;
        let ram_buffer_binding = device.create_buffer(&BufferDescriptor {
            label: Some("RISC-V RAM Binding 0"),
            size: ram_buffer_binding_size,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        queue.write_buffer(&ram_buffer_binding, 0, &code_bytes);

        let ram_base = 0x80000000u32;
        let code_offset = (program.entry_point - ram_base) as usize;

        if code_offset + code_bytes.len() <= RAM_SIZE as usize {
            queue.write_buffer(&ram_buffer, code_offset as u64, &code_bytes);
        }

        // Create registers buffer (32 x u32)
        let registers_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("RISC-V Registers"),
            size: (REGISTER_COUNT * 4) as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: true,
        });

        // Initialize registers to zero
        {
            let mut view = registers_buffer.slice(..).get_mapped_range_mut();
            for chunk in view.chunks_exact_mut(4) {
                chunk.copy_from_slice(&0u32.to_le_bytes());
            }
            drop(view); // Explicitly drop before unmapping
        }
        registers_buffer.unmap();

        // Create PC buffer (atomic u32)
        let pc_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("RISC-V PC"),
            size: 4,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: true,
        });
        {
            let mut view = pc_buffer.slice(..).get_mapped_range_mut();
            view.copy_from_slice(&program.entry_point.to_le_bytes());
            drop(view);
        }
        pc_buffer.unmap();

        // Create state buffer
        let state = ExecutionState {
            running: 1,
            exit_code: 0,
            instruction_count: 0,
            cycle_count: 0,
            privilege: 3, // Machine mode
            satp: 0,
            pending_interrupt: 0,
            trap_pending: 0,
        };
        let state_buffer = Self::create_buffer_init(device, &state);

        // Create CSRs buffer
        let csrs = CSRBank {
            misa: 0x40001105, // RV32IMA
            ..Default::default()
        };
        let csrs_buffer = Self::create_buffer_init(device, &csrs);

        // Create MMIO buffer
        let mmio = MMIOState {
            uart_lsr: 0x60, // THRE and TEMT set
            uart_msr: 0x30, // CTS and DSR set
            ..Default::default()
        };
        let mmio_buffer = Self::create_buffer_init(device, &mmio);

        // Create stats buffer (256 x u32)
        let stats_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("RISC-V Stats"),
            size: 256 * 4,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_SRC
                | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: true,
        });
        {
            let mut view = stats_buffer.slice(..).get_mapped_range_mut();
            // Initialize to all zeros
            view.copy_from_slice(&vec![0u8; 256 * 4]);
            drop(view);
        }
        stats_buffer.unmap();

        // Create config buffer
        let config = Config {
            texture_width: program.metadata.grid_size,
            texture_height: program.metadata.grid_size,
            memory_size: RAM_SIZE,
            enable_mmu: 0,
            enable_trace: 0,
            reserved: 0,
        };
        let config_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("RISC-V Config"),
            size: std::mem::size_of::<Config>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: true,
        });
        {
            let data_bytes = bytemuck::bytes_of(&config);
            let mut view = config_buffer.slice(..).get_mapped_range_mut();
            view.copy_from_slice(data_bytes);
            drop(view);
        }
        config_buffer.unmap();

        // Create bind group
        let bind_group = device.create_bind_group(&BindGroupDescriptor {
            label: Some("RISC-V VM Bind Group"),
            layout: bind_group_layout,
            entries: &[
                BindGroupEntry {
                    binding: 0,
                    resource: ram_buffer_binding.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 1,
                    resource: registers_buffer.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 2,
                    resource: ram_buffer.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 3,
                    resource: pc_buffer.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 4,
                    resource: state_buffer.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 5,
                    resource: csrs_buffer.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 6,
                    resource: mmio_buffer.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 7,
                    resource: stats_buffer.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 8,
                    resource: config_buffer.as_entire_binding(),
                },
            ],
        });

        Ok(Self {
            ram_buffer_binding,
            ram_buffer,
            registers_buffer,
            pc_buffer,
            state_buffer,
            csrs_buffer,
            mmio_buffer,
            stats_buffer,
            config_buffer,
            bind_group,
        })
    }

    /// Helper function to create a buffer initialized with data
    fn create_buffer_init<T: Pod + Zeroable>(device: &Device, data: &T) -> Buffer {
        let buffer = device.create_buffer(&BufferDescriptor {
            label: None,
            size: std::mem::size_of::<T>() as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: true,
        });

        // Copy data into the mapped buffer
        let data_bytes = bytemuck::bytes_of(data);
        {
            let mut view = buffer.slice(..).get_mapped_range_mut();
            view.copy_from_slice(data_bytes);
            drop(view);
        }
        buffer.unmap();

        buffer
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_memory_buffer_sizes() {
        // Verify buffer sizes
        assert_eq!(RAM_SIZE, 256 * 1024 * 1024);
        assert_eq!(REGISTER_COUNT, 32);

        // Registers: 32 x 4 bytes = 128 bytes
        assert_eq!(REGISTER_COUNT * 4, 128);

        // PC: 4 bytes
        assert_eq!(std::mem::size_of::<u32>(), 4);

        // State struct size
        assert_eq!(std::mem::size_of::<ExecutionState>(), 8 * 4);

        // CSRs struct size: 25 u32 fields = 100 bytes
        assert_eq!(std::mem::size_of::<CSRBank>(), 25 * 4);

        // MMIO struct size
        assert_eq!(std::mem::size_of::<MMIOState>(), 19 * 4);

        // Config struct size
        assert_eq!(std::mem::size_of::<Config>(), 6 * 4);
    }

    #[test]
    fn test_execution_state_default() {
        let state = ExecutionState {
            running: 1,
            exit_code: 0,
            instruction_count: 0,
            cycle_count: 0,
            privilege: 3,
            satp: 0,
            pending_interrupt: 0,
            trap_pending: 0,
        };
        assert_eq!(state.running, 1);
        assert_eq!(state.privilege, 3);
    }

    #[test]
    fn test_csr_default() {
        let csrs = CSRBank::default();
        assert_eq!(csrs.misa, 0x40001105); // RV32IMA
    }

    #[test]
    fn test_mmio_default() {
        let mmio = MMIOState::default();
        assert_eq!(mmio.uart_lsr, 0x60);
        assert_eq!(mmio.uart_msr, 0x30);
    }
}
