//! Glyph VM Scheduler - GPU-Native Multi-Tasking
//!
//! Manages multiple Glyph VMs running in parallel on GPU via pre-allocated slots.
//! Implements SPATIAL_SPAWN for dynamic VM creation without CPU round-trips.
//!
//! Architecture:
//! - 8 pre-allocated VM slots in GPU memory
//! - Round-robin scheduler runs each VM for 64 cycles/frame
//! - SPATIAL_SPAWN allocates free slots and initializes state
//! - Inter-VM messaging via mailbox queue

use crate::glyph_stratum::glyph_compiler::hilbert_d2xy;
use std::sync::{Arc, Mutex};

/// Maximum concurrent VMs
pub const MAX_VMS: usize = 8;

/// VM state constants (must match shader)
pub mod vm_state {
    pub const INACTIVE: u32 = 0;
    pub const RUNNING: u32 = 1;
    pub const HALTED: u32 = 2;
    pub const WAITING: u32 = 3;
}

/// Single VM configuration
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct VmConfig {
    /// Initial program counter (Hilbert index into .rts.png)
    pub entry_point: u32,
    /// Parent VM ID (0xFF = no parent)
    pub parent_id: u32,
    /// Spatial MMU: Start Hilbert index
    pub base_addr: u32,
    /// Spatial MMU: End Hilbert index (0 = unrestricted)
    pub bound_addr: u32,
    /// Initial register values (128 registers)
    pub initial_regs: [u32; 128],
}

impl Default for VmConfig {
    fn default() -> Self {
        Self {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        }
    }
}

/// VM statistics read back from GPU
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct VmStats {
    pub vm_id: u32,
    pub state: u32,
    pub pc: u32,
    pub cycles: u32,
    pub halted: u32,
    pub parent_id: u32,
}

/// Scheduler statistics
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct SchedulerStats {
    pub active_count: u32,
    pub frame: u32,
    pub spawn_count: u32,
}

/// Glyph VM Scheduler - manages multi-VM execution on GPU
pub struct GlyphVmScheduler {
    device: Arc<wgpu::Device>,
    queue: Arc<wgpu::Queue>,

    /// Compute pipeline for the scheduler
    pipeline: wgpu::ComputePipeline,

    /// Bind group layout
    bind_group_layout: wgpu::BindGroupLayout,

    /// VM state buffer (8 VmState structs)
    vm_buffer: wgpu::Buffer,

    /// Scheduler state buffer
    scheduler_buffer: wgpu::Buffer,

    /// Message queue buffer
    message_buffer: wgpu::Buffer,

    /// Event queue header buffer
    event_header_buffer: wgpu::Buffer,

    /// Event queue buffer
    event_queue_buffer: wgpu::Buffer,

    /// Readback buffer for stats
    stats_buffer: wgpu::Buffer,

    /// RAM texture view (.rts.png program memory)
    ram_view: Option<wgpu::TextureView>,

    /// RAM texture (for write_texture operations in poke_substrate_single)
    ram_texture: Option<Arc<wgpu::Texture>>,

    /// Shadow RAM buffer for CPU-side reads (workaround for Intel Vulkan driver bugs)
    shadow_ram: Arc<Mutex<Vec<u8>>>,

    /// Frame counter for debugging
    frame_count: std::sync::atomic::AtomicU64,
}

impl GlyphVmScheduler {
    /// Create a new Glyph VM Scheduler
    pub fn new(
        device: Arc<wgpu::Device>,
        queue: Arc<wgpu::Queue>,
        shadow_ram: Arc<Mutex<Vec<u8>>>,
    ) -> Self {
        let shader_source = include_str!("shaders/glyph_vm_scheduler.wgsl");
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Glyph VM Scheduler Shader"),
            source: wgpu::ShaderSource::Wgsl(shader_source.into()),
        });

        // Bind group layout:
        // 0: RAM texture (rgba8uint, read_write)
        // 1: VM states array (storage, read_write)
        // 2: Scheduler state (storage, read_write)
        // 3: Message queue (storage, read_write)
        // 4: Event queue header (storage, read_only)
        // 5: Event queue (storage, read_only)
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Glyph VM Scheduler Bind Group Layout"),
            entries: &[
                // Binding 0: RAM Texture
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::StorageTexture {
                        access: wgpu::StorageTextureAccess::ReadWrite,
                        format: wgpu::TextureFormat::Rgba8Uint,
                        view_dimension: wgpu::TextureViewDimension::D2,
                    },
                    count: None,
                },
                // Binding 1: VM States
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
                // Binding 2: Scheduler State
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
                // Binding 3: Message Queue
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
                // Binding 4: Event Queue Header
                wgpu::BindGroupLayoutEntry {
                    binding: 4,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 5: Event Queue
                wgpu::BindGroupLayoutEntry {
                    binding: 5,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Glyph VM Scheduler Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        eprintln!("[SCHEDULER] Creating compute pipeline...");

        let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Glyph VM Scheduler Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "main",
        });

        eprintln!("[SCHEDULER] Compute pipeline created OK");

        // Create VM state buffer
        // Each VmState is: 128 regs + 12 fields + 64 stack = 204 u32s = 816 bytes
        // Total: 8 * 816 = 6528 bytes
        let vm_buffer_size = 8 * 816;
        let vm_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph VM States Buffer"),
            size: vm_buffer_size,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        // Create scheduler state buffer
        let scheduler_buffer_size = 32; // 8 u32s with padding
        let scheduler_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph VM Scheduler State Buffer"),
            size: scheduler_buffer_size,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        // Create message queue buffer
        // 32 vec4<u32> mailboxes + 8 head + 8 tail = 32*16 + 64 = 576 bytes
        let message_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph VM Message Queue Buffer"),
            size: 576,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create event queue header buffer
        // EventQueueHeader: head (u32), tail (u32), padding [2 u32s] = 16 bytes
        let event_header_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph VM Event Header Buffer"),
            size: 16,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create event queue buffer
        // 1024 InputEvents * 32 bytes each = 32768 bytes
        let event_queue_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph VM Event Queue Buffer"),
            size: 1024 * 32,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create readback buffer for stats
        let stats_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph VM Stats Readback Buffer"),
            size: vm_buffer_size + scheduler_buffer_size,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        Self {
            device,
            queue,
            pipeline,
            bind_group_layout,
            vm_buffer,
            scheduler_buffer,
            message_buffer,
            event_header_buffer,
            event_queue_buffer,
            stats_buffer,
            ram_view: None,
            ram_texture: None,
            shadow_ram,
            frame_count: std::sync::atomic::AtomicU64::new(0),
        }
    }

    /// Set the RAM texture (program memory)
    pub fn set_ram_texture(&mut self, texture: Arc<wgpu::Texture>) {
        eprintln!("[SCHEDULER] Setting RAM texture view...");
        // Store the texture for write_texture operations
        self.ram_texture = Some(texture);
        self.ram_view = Some(texture.create_view(&wgpu::TextureViewDescriptor {
            label: Some("RAM Texture View"),
            format: Some(wgpu::TextureFormat::Rgba8Uint),
            dimension: Some(wgpu::TextureViewDimension::D2),
            aspect: wgpu::TextureAspect::All,
            base_mip_level: 0,
            mip_level_count: None,
            base_array_layer: 0,
            array_layer_count: None,
        }));
        eprintln!("[SCHEDULER] RAM texture view set OK");
    }

    /// Initialize a VM slot with configuration
    pub fn spawn_vm(&self, vm_id: u32, config: &VmConfig) -> Result<(), String> {
        if vm_id as usize >= MAX_VMS {
            return Err(format!("Invalid VM ID: {} (max: {})", vm_id, MAX_VMS - 1));
        }

        // Build initial VM state
        // VmState layout matches shader:
        // - regs: [u32; 128] = 128 u32s (512 bytes)
        // - pc, halted, stratum, cycles, stack_ptr, vm_id, state, parent_id, entry_point, base_addr, bound_addr, _padding = 12 u32s (48 bytes)
        // - stack: [u32; 64] = 64 u32s (256 bytes)
        // Total: 128 + 12 + 64 = 204 u32s = 816 bytes
        let mut vm_data = Vec::with_capacity(204);

        // Copy initial registers (config.initial_regs is already [u32; 128])
        vm_data.extend_from_slice(&config.initial_regs);

        // Fields (at offset 512)
        vm_data.push(config.entry_point); // pc
        vm_data.push(0); // halted
        vm_data.push(2); // stratum (LOGIC)
        vm_data.push(0); // cycles
        vm_data.push(0); // stack_ptr
        vm_data.push(vm_id); // vm_id
        vm_data.push(vm_state::RUNNING); // state
        vm_data.push(config.parent_id); // parent_id
        vm_data.push(config.entry_point); // entry_point
        vm_data.push(config.base_addr); // base_addr
        vm_data.push(config.bound_addr); // bound_addr
        vm_data.push(0); // _padding (to match 816-byte stride)

        // Stack (64 zeros)
        vm_data.extend_from_slice(&[0u32; 64]);

        // Verify size
        assert_eq!(
            vm_data.len(),
            204,
            "VM data size mismatch: expected 204, got {}",
            vm_data.len()
        );

        // Calculate offset in buffer
        let offset = (vm_id as u64) * 816;

        self.queue
            .write_buffer(&self.vm_buffer, offset, bytemuck::cast_slice(&vm_data));

        // Flush the write to ensure it's visible to GPU before execution
        self.queue.submit([]);
        self.device.poll(wgpu::Maintain::Wait);

        // Update scheduler active count (atomic increment would be better but requires shader)
        // For now, we track on CPU side

        log::info!(
            "Spawned VM {} at entry point 0x{:X} (flushed)",
            vm_id,
            config.entry_point
        );
        Ok(())
    }

    /// Halt a specific VM
    pub fn halt_vm(&self, vm_id: u32) -> Result<(), String> {
        if vm_id as usize >= MAX_VMS {
            return Err(format!("Invalid VM ID: {}", vm_id));
        }

        // Write state = HALTED at offset + 536 (after regs[128] + pc + halted + stratum + cycles + stack_ptr + vm_id)
        // Layout: regs[128]=512, pc=4, halted=4, stratum=4, cycles=4, stack_ptr=4, vm_id=4 -> 536 bytes
        let state_offset = (vm_id as u64) * 816 + 536;
        // 512 + 6*4 = 536. Correct.
        self.queue.write_buffer(
            &self.vm_buffer,
            state_offset,
            bytemuck::cast_slice(&[vm_state::HALTED]),
        );

        log::info!("Halted VM {}", vm_id);
        Ok(())
    }

    /// Resume a halted VM
    pub fn resume_vm(&self, vm_id: u32) -> Result<(), String> {
        if vm_id as usize >= MAX_VMS {
            return Err(format!("Invalid VM ID: {}", vm_id));
        }

        // Write state = RUNNING at offset + 536
        let state_offset = (vm_id as u64) * 816 + 536;
        self.queue.write_buffer(
            &self.vm_buffer,
            state_offset,
            bytemuck::cast_slice(&[vm_state::RUNNING]),
        );
        self.queue.submit(None);
        self.device.poll(wgpu::Maintain::Wait);

        log::info!("Resumed VM {}", vm_id);
        Ok(())
    }

    /// Pause all VMs and wait for GPU to complete all pending work
    pub fn pause_all(&self) {
        // Submit an empty command buffer to ensure all GPU work is complete
        let encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("pause encoder"),
            });
        self.queue.submit(Some(encoder.finish()));
        self.device.poll(wgpu::Maintain::Wait);
        log::info!("All VMs paused and GPU synchronized");
    }

    /// Read the current state of a VM from GPU memory
    pub fn get_vm_state(&self, vm_id: u32) -> Result<u32, String> {
        let stats = self.read_stats();
        stats
            .iter()
            .find(|s| s.vm_id == vm_id)
            .map(|s| s.state)
            .ok_or_else(|| format!("VM {} not found in stats", vm_id))
    }

    /// Poll trap region for pending requests
    fn poll_trap_region(&mut self) {
        // Read trap status from substrate
        // This would use texture readback to check TRAP_STATUS at 0xFF000014
        // For now, we just log that we're polling
        log::trace!("[TRAP] Polling trap region");
    }

    /// Execute one frame of the scheduler
    pub fn execute_frame(&mut self) {
        let ram_view = match &self.ram_view {
            Some(view) => view,
            None => {
                return;
            },
        };

        let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Glyph VM Scheduler Bind Group"),
            layout: &self.bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: wgpu::BindingResource::TextureView(ram_view),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: self.vm_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: self.scheduler_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: self.message_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 4,
                    resource: self.event_header_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 5,
                    resource: self.event_queue_buffer.as_entire_binding(),
                },
            ],
        });

        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Glyph VM Scheduler Encoder"),
            });

        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Glyph VM Scheduler Pass"),
                timestamp_writes: None,
            });
            compute_pass.set_pipeline(&self.pipeline);
            compute_pass.set_bind_group(0, &bind_group, &[]);
            compute_pass.dispatch_workgroups(1, 1, 1);
        }

        self.queue.submit(std::iter::once(encoder.finish()));

        // Ensure the compute pass completes before continuing
        self.device.poll(wgpu::Maintain::Wait);

        // Increment frame counter
        let frame = self
            .frame_count
            .fetch_add(1, std::sync::atomic::Ordering::Relaxed);
        if frame % 60 == 0 {
            eprintln!("[SCHEDULER] Frame {} complete", frame);
        }

        // Poll trap region for pending requests
        self.poll_trap_region();
    }

    /// Read VM statistics from GPU
    pub fn read_stats(&self) -> Vec<VmStats> {
        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Glyph VM Stats Read Encoder"),
            });

        // Copy VM buffer to readback buffer (8 * 816 bytes)
        let vm_buffer_size = 8 * 816;
        encoder.copy_buffer_to_buffer(&self.vm_buffer, 0, &self.stats_buffer, 0, vm_buffer_size);

        self.queue.submit(std::iter::once(encoder.finish()));

        let slice = self.stats_buffer.slice(..vm_buffer_size);
        let (tx, rx) = std::sync::mpsc::channel();
        slice.map_async(wgpu::MapMode::Read, move |res| {
            tx.send(res).ok();
        });
        self.device.poll(wgpu::Maintain::Wait);

        // Use pollster::block_on for simplicity if needed
        if let Ok(Ok(())) = pollster::block_on(async { rx.recv() }) {
            let data = slice.get_mapped_range();
            let mut stats = Vec::with_capacity(MAX_VMS);

            for i in 0..MAX_VMS {
                let offset = i * 816;
                // Field offsets (relative to start of VM state):
                // pc: 512, halted: 516, stratum: 520, cycles: 524, stack_ptr: 528, vm_id: 532, state: 536, parent_id: 540

                let get_u32 = |off: usize| {
                    u32::from_le_bytes(
                        data[offset + off..offset + off + 4]
                            .try_into()
                            .expect("Failed to read u32 from buffer"),
                    )
                };

                stats.push(VmStats {
                    vm_id: get_u32(532),
                    state: get_u32(536),
                    pc: get_u32(512),
                    cycles: get_u32(524),
                    halted: get_u32(516),
                    parent_id: get_u32(540),
                });
            }

            drop(data);
            self.stats_buffer.unmap();
            stats
        } else {
            log::warn!("Failed to read VM stats from GPU");
            Vec::new()
        }
    }

    /// Get PC of a specific VM
    pub fn get_vm_pc(&self, vm_id: u32) -> Result<u32, String> {
        let stats = self.read_stats();
        stats
            .iter()
            .find(|s| s.vm_id == vm_id)
            .map(|s| s.pc)
            .ok_or_else(|| format!("VM {} not found in stats", vm_id))
    }

    /// Count active VMs (non-INACTIVE state)
    pub fn active_vm_count(&self) -> usize {
        let stats = self.read_stats();
        stats
            .iter()
            .filter(|s| s.state != vm_state::INACTIVE)
            .count()
    }

    /// Reset all VMs to inactive state
    pub fn reset_all(&self) {
        // Zero out VM buffer
        let zeros = vec![0u32; 8 * 108];
        self.queue
            .write_buffer(&self.vm_buffer, 0, bytemuck::cast_slice(&zeros));

        // Reset scheduler state
        let scheduler_init: [u32; 8] = [0, 0, 0, 0, 0, 0, 0, 0];
        self.queue.write_buffer(
            &self.scheduler_buffer,
            0,
            bytemuck::cast_slice(&scheduler_init),
        );

        log::info!("Reset all Glyph VMs");
    }

    /// Get the bind group layout for external use
    pub fn bind_group_layout(&self) -> &wgpu::BindGroupLayout {
        &self.bind_group_layout
    }

    /// Peek substrate memory at trap base (6 u32 values = 24 bytes)
    /// Uses shadow buffer for reliable CPU-side reads
    pub fn peek_substrate(&self, base: u32, count: u32) -> [u8; 24] {
        let mut result = [0u8; 24];

        // Read from shadow buffer
        let shadow = self.shadow_ram.lock().unwrap();
        let start_offset = base as usize * 4;
        let bytes_to_read = (count as usize * 4).min(24);

        if start_offset + bytes_to_read <= shadow.len() {
            result[..bytes_to_read]
                .copy_from_slice(&shadow[start_offset..start_offset + bytes_to_read]);
        }

        log::debug!(
            "[TRAP] peek_substrate at 0x{:08X} ({} values) -> {:02X?}",
            base,
            count,
            &result[..bytes_to_read]
        );

        result
    }

    /// Write trap registers back to substrate
    pub fn write_trap_regs(&mut self, regs: &crate::trap_interface::TrapRegs) {
        use crate::trap_interface::TRAP_BASE;

        // Write trap registers to shadow buffer
        let mut shadow = self.shadow_ram.lock().unwrap();
        let base_offset = TRAP_BASE as usize;

        // Write each field as little-endian u32
        if base_offset + 24 <= shadow.len() {
            shadow[base_offset..base_offset + 4].copy_from_slice(&regs.op_type.to_le_bytes());
            shadow[base_offset + 4..base_offset + 8].copy_from_slice(&regs.arg0.to_le_bytes());
            shadow[base_offset + 8..base_offset + 12].copy_from_slice(&regs.arg1.to_le_bytes());
            shadow[base_offset + 12..base_offset + 16].copy_from_slice(&regs.arg2.to_le_bytes());
            shadow[base_offset + 16..base_offset + 20].copy_from_slice(&regs.result.to_le_bytes());
            shadow[base_offset + 20..base_offset + 24].copy_from_slice(&regs.status.to_le_bytes());
        }

        log::debug!(
            "[TRAP] write_trap_regs: op={} status={} result=0x{:08X}",
            regs.op_type,
            regs.status,
            regs.result
        );
    }

    /// Spawn VM from trap request - returns VM ID on success, 0xFF on failure
    pub fn spawn_vm_from_trap(&mut self, entry: u32, _config: u32) -> u8 {
        // Find first available VM slot
        for vm_id in 0..MAX_VMS {
            let state_result = self.get_vm_state(vm_id as u32);
            if let Ok(state) = state_result {
                if state == crate::glyph_vm_scheduler::vm_state::INACTIVE {
                    let config = VmConfig {
                        entry_point: entry,
                        ..Default::default()
                    };
                    if self.spawn_vm(vm_id as u32, &config).is_ok() {
                        return vm_id as u8;
                    }
                }
            }
        }
        0xFF // No available slot
    }

    /// Kill VM by ID - returns 0 on success, 0xFF on failure
    pub fn kill_vm(&mut self, vm_id: u32) -> u8 {
        if vm_id as usize >= MAX_VMS {
            return 0xFF;
        }
        if self.halt_vm(vm_id).is_ok() {
            println!("[TRAP] Kill VM {} completed", vm_id);
            0
        } else {
            0xFF
        }
    }

    /// Peek single substrate value
    pub fn peek_substrate_single(&self, addr: u32) -> u32 {
        let shadow = self.shadow_ram.lock().unwrap();
        let offset = addr as usize * 4;
        if offset + 4 <= shadow.len() {
            u32::from_le_bytes([
                shadow[offset],
                shadow[offset + 1],
                shadow[offset + 2],
                shadow[offset + 3],
            ])
        } else {
            0
        }
    }

    /// Poke single substrate value
    pub fn poke_substrate_single(&mut self, addr: u32, val: u32) {
        // Update shadow buffer
        let mut shadow = self.shadow_ram.lock().unwrap();
        let offset = addr as usize * 4;
        if offset + 4 <= shadow.len() {
            shadow[offset..offset + 4].copy_from_slice(&val.to_le_bytes());
        }
        drop(shadow); // Release lock before GPU operations

        // Also write to GPU texture
        if let Some(ref texture) = self.ram_texture {
            let (tx, ty) = hilbert_d2xy(4096, addr);
            self.queue.write_texture(
                wgpu::ImageCopyTexture {
                    texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                    aspect: wgpu::TextureAspect::All,
                },
                &val.to_le_bytes(),
                wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(4),
                    rows_per_image: Some(1),
                },
                wgpu::Extent3d {
                    width: 1,
                    height: 1,
                    depth_or_array_layers: 1,
                },
            );
        }
        log::debug!("[POKE] addr=0x{:x} val=0x{:x}", addr, val);
    }

    /// Copy glyphs from source to target address in substrate
    /// Used for self-modifying code - scheduler can rewrite itself
    ///
    /// # Arguments
    /// * `target` - Destination address in substrate
    /// * `source` - Source address in substrate
    /// * `count` - Number of glyphs (4-byte words) to copy
    pub fn glyph_write(&mut self, target: u32, source: u32, count: u32) -> u32 {
        if count == 0 {
            // Single glyph copy
            let value = self.peek_substrate_single(source);
            self.poke_substrate_single(target, value);
            1 // 1 glyph copied
        } else {
            // Multiple glyph copy
            for i in 0..count {
                let src_addr = source + (i * 4);
                let dst_addr = target + (i * 4);
                let value = self.peek_substrate_single(src_addr);
                self.poke_substrate_single(dst_addr, value);
            }
            count
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_vm_config_default() {
        let config = VmConfig::default();
        assert_eq!(config.entry_point, 0);
        assert_eq!(config.parent_id, 0xFF);
    }

    #[test]
    fn test_vm_state_constants() {
        assert_eq!(vm_state::INACTIVE, 0);
        assert_eq!(vm_state::RUNNING, 1);
        assert_eq!(vm_state::HALTED, 2);
        assert_eq!(vm_state::WAITING, 3);
    }

    #[test]
    fn test_spatial_mmu_vm_config() {
        // VM #0 (root) should have unrestricted access
        let root_config = VmConfig {
            entry_point: 0x0000,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0, // 0 = unrestricted
            initial_regs: [0; 128],
        };
        assert_eq!(
            root_config.bound_addr, 0,
            "Root VM should have unrestricted memory"
        );

        // Child VMs should have bounded memory regions
        let child_config = VmConfig {
            entry_point: 0x8000,
            parent_id: 0,
            base_addr: 0x1000,  // Start of child's region
            bound_addr: 0x1FFF, // End of child's region
            initial_regs: [0; 128],
        };
        assert!(
            child_config.base_addr < child_config.bound_addr,
            "Child VM should have valid memory bounds"
        );
        assert!(
            child_config.bound_addr > 0,
            "Child VM should have restricted memory"
        );
    }

    #[test]
    fn test_vm_config_memory_region_size() {
        // Test that we can calculate memory region sizes
        let base = 0x1000u32;
        let bound = 0x1FFFu32;
        let size = bound - base + 1;
        assert_eq!(size, 0x1000, "Memory region should be 4KB");
    }

    #[test]
    fn test_vm_isolation_multiple_vms() {
        // Test that multiple VMs can be configured with isolated memory
        let configs: Vec<VmConfig> = (0..4)
            .map(|i| VmConfig {
                entry_point: i * 0x1000,
                parent_id: if i == 0 { 0xFF } else { 0 },
                base_addr: if i == 0 { 0 } else { i * 0x1000 },
                bound_addr: if i == 0 { 0 } else { (i + 1) * 0x1000 - 1 },
                initial_regs: [0; 128],
            })
            .collect();

        // Verify VM #0 has unrestricted access
        assert_eq!(configs[0].bound_addr, 0);

        // Verify child VMs have non-overlapping regions
        for i in 1..4 {
            assert!(
                configs[i].bound_addr > 0,
                "Child VM {} should have bounded memory",
                i
            );
            if i > 1 {
                assert!(
                    configs[i].base_addr > configs[i - 1].bound_addr,
                    "VM {} region should not overlap with VM {}",
                    i,
                    i - 1
                );
            }
        }
    }
}
