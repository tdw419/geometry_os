//! RISC-V Native GPU Memory Layout Module
//!
//! GPU buffer layouts matching the VM shader's bind group layout.
//! See: systems/riscv_gpu/shaders/riscv_linux_vm.wgsl

use anyhow::Result;
use wgpu::*;

pub const RAM_SIZE: u32 = 256 * 1024 * 1024; // 256MB

/// Execution state matching WGSL shader
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
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

/// Control and Status Registers bank matching WGSL shader
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
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

/// Memory-Mapped I/O state matching WGSL shader
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct MMIOState {
    // UART 16550
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

/// VM configuration matching WGSL shader
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct Config {
    pub texture_width: u32,
    pub texture_height: u32,
    pub memory_size: u32,
    pub enable_mmu: u32,
    pub enable_trace: u32,
    pub reserved: u32,
}

/// GPU buffers for RISC-V VM (matching shader bind group layout)
pub struct VMBuffers {
    pub registers_buffer: Buffer,
    pub memory_buffer: Buffer,
    pub pc_buffer: Buffer,
    pub state_buffer: Buffer,
    pub csrs_buffer: Buffer,
    pub mmio_buffer: Buffer,
    pub stats_buffer: Buffer,
    pub config_buffer: Buffer,
    pub ram_texture: Texture,
    pub ram_texture_view: TextureView,
    pub bind_group: BindGroup,
}

// Helper trait for buffer initialization
trait BufferInitExt {
    fn create_buffer_init<T: bytemuck::Pod + bytemuck::Zeroable>(&self, data: &T) -> Buffer;
}

impl BufferInitExt for Device {
    fn create_buffer_init<T: bytemuck::Pod + bytemuck::Zeroable>(&self, data: &T) -> Buffer {
        let buffer = self.create_buffer(&BufferDescriptor {
            label: None,
            size: std::mem::size_of::<T>() as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: true,
        });

        // Copy data to buffer
        let bytes = bytemuck::bytes_of(data);
        buffer
            .slice(..)
            .get_mapped_range_mut()
            .copy_from_slice(bytes);
        buffer.unmap();

        buffer
    }
}

impl VMBuffers {
    pub fn new(
        device: &Device,
        queue: &Queue,
        program: &super::NativeRiscvProgram,
        bind_group_layout: &BindGroupLayout,
    ) -> Result<Self> {
        use wgpu::BufferUsages;

        // Create registers buffer (32 x u32 = 128 bytes)
        let registers_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("RISC-V Registers"),
            size: 128,
            usage: BufferUsages::STORAGE | BufferUsages::COPY_DST,
            mapped_at_creation: true,
        });
        registers_buffer.slice(..).get_mapped_range_mut().fill(0);
        registers_buffer.unmap();

        // Create memory buffer (RAM_SIZE)
        let memory_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("RISC-V Memory"),
            size: RAM_SIZE as u64,
            usage: BufferUsages::STORAGE | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Load program code into memory at correct offset
        let code_bytes: Vec<u8> = program.code.iter().flat_map(|w| w.to_le_bytes()).collect();
        let ram_base = 0x80000000u32;
        let code_offset = (program.entry_point - ram_base) as u64;
        if code_offset + code_bytes.len() as u64 <= RAM_SIZE as u64 {
            queue.write_buffer(&memory_buffer, code_offset, &code_bytes);
        }

        // Create PC buffer (u32)
        let pc_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("RISC-V PC"),
            size: 4,
            usage: BufferUsages::STORAGE | BufferUsages::COPY_DST,
            mapped_at_creation: true,
        });
        pc_buffer
            .slice(..)
            .get_mapped_range_mut()
            .copy_from_slice(&program.entry_point.to_le_bytes());
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
        let state_buffer = device.create_buffer_init(&state);

        // Create CSRs buffer
        let csrs = CSRBank {
            misa: 0x40001105, // RV32IMA
            ..Default::default()
        };
        let csrs_buffer = device.create_buffer_init(&csrs);

        // Create MMIO buffer
        let mmio = MMIOState {
            uart_lsr: 0x60, // THRE and TEMT set
            uart_msr: 0x30, // CTS and DSR set
            uart_dll: 0x0c, // 9600 baud default
            ..Default::default()
        };
        let mmio_buffer = device.create_buffer_init(&mmio);

        // Create stats buffer (256 x u32)
        let stats_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("RISC-V Stats"),
            size: 256 * 4,
            usage: BufferUsages::STORAGE | BufferUsages::COPY_SRC | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create config buffer
        let config = Config {
            texture_width: program.texture_size,
            texture_height: program.texture_size,
            memory_size: RAM_SIZE,
            enable_mmu: 0,
            enable_trace: 0,
            reserved: 0,
        };
        let config_buffer = device.create_buffer_init(&config);

        // Create RAM texture from program code
        let texture_size = program.texture_size as u32;
        let mut texture_data = Vec::with_capacity((texture_size * texture_size * 4) as usize);

        // Fill texture with program code
        for word in &program.code {
            let bytes = word.to_le_bytes();
            texture_data.push(bytes[0]);
            texture_data.push(bytes[1]);
            texture_data.push(bytes[2]);
            texture_data.push(bytes[3]);
        }

        // Pad remaining texture space
        while texture_data.len() < (texture_size * texture_size * 4) as usize {
            texture_data.push(0);
        }

        let ram_texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("RISC-V RAM Texture"),
            size: wgpu::Extent3d {
                width: texture_size,
                height: texture_size,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Unorm,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
            view_formats: &[],
        });

        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &ram_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &texture_data,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(texture_size * 4),
                rows_per_image: None,
            },
            wgpu::Extent3d {
                width: texture_size,
                height: texture_size,
                depth_or_array_layers: 1,
            },
        );

        let ram_texture_view = ram_texture.create_view(&wgpu::TextureViewDescriptor::default());

        // Create bind group
        let bind_group = device.create_bind_group(&BindGroupDescriptor {
            label: Some("RISC-V VM Bind Group"),
            layout: bind_group_layout,
            entries: &[
                BindGroupEntry {
                    binding: 0,
                    resource: wgpu::BindingResource::TextureView(&ram_texture_view),
                },
                BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::Buffer(
                        registers_buffer.as_entire_buffer_binding(),
                    ),
                },
                BindGroupEntry {
                    binding: 2,
                    resource: wgpu::BindingResource::Buffer(
                        memory_buffer.as_entire_buffer_binding(),
                    ),
                },
                BindGroupEntry {
                    binding: 3,
                    resource: wgpu::BindingResource::Buffer(pc_buffer.as_entire_buffer_binding()),
                },
                BindGroupEntry {
                    binding: 4,
                    resource: wgpu::BindingResource::Buffer(
                        state_buffer.as_entire_buffer_binding(),
                    ),
                },
                BindGroupEntry {
                    binding: 5,
                    resource: wgpu::BindingResource::Buffer(csrs_buffer.as_entire_buffer_binding()),
                },
                BindGroupEntry {
                    binding: 6,
                    resource: wgpu::BindingResource::Buffer(mmio_buffer.as_entire_buffer_binding()),
                },
                BindGroupEntry {
                    binding: 7,
                    resource: wgpu::BindingResource::Buffer(
                        stats_buffer.as_entire_buffer_binding(),
                    ),
                },
                BindGroupEntry {
                    binding: 8,
                    resource: wgpu::BindingResource::Buffer(
                        config_buffer.as_entire_buffer_binding(),
                    ),
                },
            ],
        });

        Ok(Self {
            registers_buffer,
            memory_buffer,
            pc_buffer,
            state_buffer,
            csrs_buffer,
            mmio_buffer,
            stats_buffer,
            config_buffer,
            ram_texture,
            ram_texture_view,
            bind_group,
        })
    }
}

impl Default for CSRBank {
    fn default() -> Self {
        Self {
            mstatus: 0,
            misa: 0,
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
            uart_iir: 0x01,
            uart_fcr: 0,
            uart_lcr: 0,
            uart_mcr: 0,
            uart_lsr: 0,
            uart_msr: 0,
            uart_scr: 0,
            uart_dll: 0,
            uart_dlh: 0,
            uart_tx_ready: 0,
            uart_rx_ready: 0,
            clint_mtime: 0,
            clint_mtimeh: 0,
            clint_mtimecmp: 0xffffffff,
            clint_mtimecmph: 0xffffffff,
            clint_msip: 0,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_struct_sizes() {
        assert_eq!(std::mem::size_of::<ExecutionState>(), 32);
        // CSRBank: 25 u32 fields = 100 bytes
        assert_eq!(std::mem::size_of::<CSRBank>(), 100);
        // MMIOState: 19 u32 fields = 76 bytes
        assert_eq!(std::mem::size_of::<MMIOState>(), 76);
        assert_eq!(std::mem::size_of::<Config>(), 24);
    }
}
