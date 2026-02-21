//! RISC-V GPU VM Executor Module
//!
//! This module provides the executor that runs RISC-V programs on the GPU.

use anyhow::Result;
use std::path::Path;
use wgpu::*;

use super::{ExecutionState, RiscvHook, RiscvPipeline, RiscvProgram, VMMemoryLayout};

/// RISC-V VM executor for running programs on the GPU
pub struct RiscvExecutor {
    /// WGPU device
    pub device: Device,
    /// WGPU queue
    pub queue: Queue,
    /// Compute pipeline
    pub pipeline: RiscvPipeline,
    /// VM memory layout (buffers, bind group)
    pub memory: Option<VMMemoryLayout>,
    /// Maximum execution cycles before timeout
    pub max_cycles: u32,
    /// UART FIFO head (read pointer)
    pub uart_head: u32,
    /// Optional instrumentation hooks
    pub hooks: Option<Box<dyn RiscvHook>>,
}

/// Result of executing a RISC-V program
#[derive(Debug)]
pub struct ExecutionResult {
    /// Exit code (0 = success)
    pub exit_code: u32,
    /// Number of cycles executed
    pub cycles_executed: u32,
    /// UART output collected during execution
    pub uart_output: String,
}

impl RiscvExecutor {
    /// Create a new RISC-V VM executor
    ///
    /// # Arguments
    /// * `device` - The WGPU device
    /// * `queue` - The WGPU queue
    pub fn new(device: Device, queue: Queue) -> Result<Self> {
        let pipeline = RiscvPipeline::new(&device)?;
        Ok(Self {
            device,
            queue,
            pipeline,
            memory: None,
            max_cycles: 100000,
            uart_head: 0,
            hooks: None,
        })
    }

    /// Set the maximum execution cycles
    pub fn with_max_cycles(mut self, max_cycles: u32) -> Self {
        self.max_cycles = max_cycles;
        self
    }

    /// Add instrumentation hooks
    pub fn with_hooks(mut self, hooks: Box<dyn RiscvHook>) -> Self {
        self.hooks = Some(hooks);
        self
    }

    /// Load a RISC-V program from an .rts.png file
    ///
    /// # Arguments
    /// * `path` - Path to the .rts.png file
    pub fn load_program(&mut self, path: impl AsRef<Path>) -> Result<()> {
        let program = RiscvProgram::load_from_rts(path)?;

        // Create memory layout with program loaded
        self.memory = Some(VMMemoryLayout::new(
            &self.device,
            &self.queue,
            &program,
            &self.pipeline.bind_group_layout,
        )?);

        Ok(())
    }

    /// Run the loaded program
    ///
    /// # Returns
    /// An `ExecutionResult` containing exit code, cycles, and UART output
    pub fn run(&mut self) -> Result<ExecutionResult> {
        if self.memory.is_none() {
            anyhow::bail!("No program loaded");
        }

        // Run init shader first
        {
            let memory = self.memory.as_ref().unwrap();
            self.run_init_shader(memory)?;
        }

        // Then run execution loop
        let mut cycles = 0;
        let mut uart_output = String::new();
        let batch_size = 10000;

        while cycles < self.max_cycles {
            {
                let memory = self.memory.as_ref().unwrap();
                self.run_execute_shader(memory)?;

                // Sync and check if halted
                self.device.poll(MaintainBase::Wait);

                let state = self.read_state(memory)?;
                let pc = self.read_pc(memory)?;

                if let Some(hooks) = &self.hooks {
                    hooks.on_batch_complete(pc, &state, cycles);
                }

                if state.running == 0 {
                    break;
                }
            }

            // Collect UART output periodically (every dispatch)
            // This borrows self mutably for uart_head, so memory must not be borrowed here
            let memory_ref = self.memory.as_ref().unwrap();
            let mut batch_uart = String::new();
            Self::collect_uart_output_static(
                &self.device,
                &self.queue,
                &memory_ref.stats_buffer,
                &mut self.uart_head,
                &mut batch_uart,
            );

            if !batch_uart.is_empty() {
                uart_output.push_str(&batch_uart);
                if let Some(hooks) = &self.hooks {
                    hooks.on_uart(&batch_uart);
                }
            }

            cycles += batch_size;
        }

        // Final UART collection
        {
            let memory_ref = self.memory.as_ref().unwrap();
            let mut batch_uart = String::new();
            Self::collect_uart_output_static(
                &self.device,
                &self.queue,
                &memory_ref.stats_buffer,
                &mut self.uart_head,
                &mut batch_uart,
            );

            if !batch_uart.is_empty() {
                uart_output.push_str(&batch_uart);
                if let Some(hooks) = &self.hooks {
                    hooks.on_uart(&batch_uart);
                }
            }
        }

        // Get final exit code and trigger halt hook
        let (exit_code, state) = {
            let memory = self.memory.as_ref().unwrap();
            let state = self.read_state(memory)?;
            (state.exit_code, state)
        };

        if let Some(hooks) = &self.hooks {
            hooks.on_halt(exit_code, cycles);
        }

        Ok(ExecutionResult {
            exit_code,
            cycles_executed: cycles,
            uart_output,
        })
    }

    /// Run the init compute shader
    fn run_init_shader(&self, memory: &VMMemoryLayout) -> Result<()> {
        let mut encoder = self.device.create_command_encoder(&Default::default());

        {
            let mut pass = encoder.begin_compute_pass(&ComputePassDescriptor::default());
            pass.set_pipeline(&self.pipeline.init_pipeline);
            pass.set_bind_group(0, &memory.bind_group, &[]);
            pass.dispatch_workgroups(1, 1, 1);
        }

        self.queue.submit(Some(encoder.finish()));
        self.device.poll(MaintainBase::Wait);
        Ok(())
    }

    /// Run the execute compute shader
    fn run_execute_shader(&self, memory: &VMMemoryLayout) -> Result<()> {
        let mut encoder = self.device.create_command_encoder(&Default::default());

        {
            let mut pass = encoder.begin_compute_pass(&ComputePassDescriptor::default());
            pass.set_pipeline(&self.pipeline.execute_pipeline);
            pass.set_bind_group(0, &memory.bind_group, &[]);
            pass.dispatch_workgroups(1, 1, 1);
        }

        self.queue.submit(Some(encoder.finish()));
        Ok(())
    }

    /// Get the current PC from the VM
    pub fn read_pc(&self, memory: &VMMemoryLayout) -> Result<u32> {
        let staging = self.device.create_buffer(&BufferDescriptor {
            label: None,
            size: 4,
            usage: BufferUsages::MAP_READ | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut encoder = self.device.create_command_encoder(&Default::default());
        encoder.copy_buffer_to_buffer(&memory.pc_buffer, 0, &staging, 0, 4);
        self.queue.submit(Some(encoder.finish()));

        let slice = staging.slice(..);
        slice.map_async(MapMode::Read, |_| {});
        self.device.poll(MaintainBase::Wait);

        let data = slice.get_mapped_range();
        let pc: u32 = u32::from_le_bytes([data[0], data[1], data[2], data[3]]);
        drop(data);
        staging.unmap();
        Ok(pc)
    }

    /// Read the execution state from the VM
    pub fn read_state(&self, memory: &VMMemoryLayout) -> Result<ExecutionState> {
        let staging = self.device.create_buffer(&BufferDescriptor {
            label: None,
            size: 32,
            usage: BufferUsages::MAP_READ | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut encoder = self.device.create_command_encoder(&Default::default());
        encoder.copy_buffer_to_buffer(&memory.state_buffer, 0, &staging, 0, 32);
        self.queue.submit(Some(encoder.finish()));

        let slice = staging.slice(..);
        slice.map_async(MapMode::Read, |_| {});
        self.device.poll(MaintainBase::Wait);

        let data = slice.get_mapped_range();
        let state: ExecutionState = *bytemuck::from_bytes(&data);
        drop(data);
        staging.unmap();
        Ok(state)
    }

    /// Check if the VM has halted
    pub fn is_halted(&self, memory: &VMMemoryLayout) -> Result<bool> {
        let staging = self.device.create_buffer(&BufferDescriptor {
            label: None,
            size: 32,
            usage: BufferUsages::MAP_READ | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut encoder = self.device.create_command_encoder(&Default::default());
        encoder.copy_buffer_to_buffer(&memory.state_buffer, 0, &staging, 0, 32);
        self.queue.submit(Some(encoder.finish()));

        let slice = staging.slice(..);
        slice.map_async(MapMode::Read, |_| {});
        self.device.poll(MaintainBase::Wait);

        let data = slice.get_mapped_range();
        let state: &ExecutionState = bytemuck::from_bytes(&data);
        let halted = state.running == 0;
        drop(data);
        staging.unmap();
        Ok(halted)
    }

    /// Get the exit code from the VM state
    pub fn get_exit_code(&self, memory: &VMMemoryLayout) -> Result<u32> {
        let staging = self.device.create_buffer(&BufferDescriptor {
            label: None,
            size: 32,
            usage: BufferUsages::MAP_READ | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut encoder = self.device.create_command_encoder(&Default::default());
        encoder.copy_buffer_to_buffer(&memory.state_buffer, 0, &staging, 0, 32);
        self.queue.submit(Some(encoder.finish()));

        let slice = staging.slice(..);
        slice.map_async(MapMode::Read, |_| {});
        self.device.poll(MaintainBase::Wait);

        let data = slice.get_mapped_range();
        let state: &ExecutionState = bytemuck::from_bytes(&data);
        let exit_code = state.exit_code;
        drop(data);
        staging.unmap();
        Ok(exit_code)
    }

    /// Collect UART output from the stats buffer (static version to avoid borrow conflicts)
    pub fn collect_uart_output_static(
        device: &Device,
        queue: &Queue,
        stats_buffer: &Buffer,
        uart_head: &mut u32,
        output: &mut String,
    ) {
        // The stats buffer contains UART output FIFO
        // stats[0] is the tail pointer (total characters written)
        // stats[1..64] is the circular buffer
        let staging = device.create_buffer(&BufferDescriptor {
            label: None,
            size: 256 * 4,
            usage: BufferUsages::MAP_READ | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut encoder = device.create_command_encoder(&Default::default());
        encoder.copy_buffer_to_buffer(stats_buffer, 0, &staging, 0, 256 * 4);
        queue.submit(Some(encoder.finish()));

        let slice = staging.slice(..);
        slice.map_async(MapMode::Read, |_| {});
        device.poll(MaintainBase::Wait);

        {
            let data = slice.get_mapped_range();
            let stats: &[u32] = bytemuck::cast_slice(&data);

            let gpu_write_count = stats[0];

            // Read all characters from uart_head to gpu_write_count
            // Characters are stored in stats[1] to stats[10]
            while *uart_head < gpu_write_count {
                let char_code = stats[(*uart_head + 1) as usize] as u8;
                if char_code != 0 {
                    // Check if it's not a null character (padding)
                    let c = char_code as char;
                    if c.is_ascii_graphic() || c == '\n' || c == '\r' || c == ' ' {
                        output.push(c);
                    }
                }
                *uart_head += 1;
            }
            drop(data);
        }
        staging.unmap();
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_executor_creation() {
        // Requires GPU - skip in unit tests
    }
}
