//! Native RV64 GPU Executor
//!
//! Executes RISC-V 64-bit programs directly on AMD GPU via DRM/AMDGPU,
//! bypassing WebGPU's u64 limitations.

use anyhow::Result;
use std::path::Path;

/// RV64 VM State (matches GLSL struct)
#[repr(C)]
#[derive(Debug, Clone, Copy, Default)]
pub struct Riscv64State {
    /// General purpose registers (64-bit)
    pub x: [u64; 32],
    /// Program counter
    pub pc: u64,
    /// Machine trap vector
    pub mtvec: u64,
    /// Machine exception PC
    pub mepc: u64,
    /// Machine trap cause
    pub mcause: u64,
    /// Machine trap value
    pub mtval: u64,
    /// Supervisor trap vector
    pub stvec: u64,
    /// Supervisor exception PC
    pub sepc: u64,
    /// Supervisor trap cause
    pub scause: u64,
    /// Supervisor trap value
    pub stval: u64,
    /// Supervisor address translation
    pub satp: u64,
    /// Machine status
    pub mstatus: u64,
    /// Supervisor status
    pub sstatus: u64,
    /// Machine interrupt enable
    pub mie: u64,
    /// Machine interrupt pending
    pub mip: u64,
    /// Supervisor interrupt enable
    pub sie: u64,
    /// Supervisor interrupt pending
    pub sip: u64,
    /// Timer register
    pub time: u64,
    /// Cycle counter
    pub cycle: u64,
    /// Instructions retired
    pub instret: u64,
    /// Current privilege level (0=U, 1=S, 3=M)
    pub privilege: u32,
    /// Execution flag
    pub running: u32,
}

impl Riscv64State {
    /// Create new state with PC set to entry point
    pub fn new(entry_point: u64) -> Self {
        let mut state = Self::default();
        state.pc = entry_point;
        state.running = 1;
        state.privilege = 3; // Start in M-mode
        state
    }
}

/// Push constants for RV64 shader
#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct Rv64PushConstants {
    /// RAM buffer device address
    pub ram_addr: u64,
    /// State buffer device address
    pub state_addr: u64,
    /// Console buffer device address
    pub console_addr: u64,
    /// RAM size in bytes
    pub ram_size: u64,
    /// Maximum execution cycles
    pub max_cycles: u32,
    pub _padding: u32,
}

/// Native RV64 GPU Executor
pub struct NativeRv64Executor {
    /// AMDGPU device
    device: crate::backend::drm::amdgpu::device::AmdGpuDevice,
    /// RAM buffer (VRAM)
    ram_buffer: Option<u32>, // BO handle
    /// State buffer (VRAM)
    state_buffer: Option<u32>,
    /// Console buffer for UART output
    console_buffer: Option<u32>,
    /// Compiled SPIR-V shader
    shader_module: Option<u32>,
    /// Current VM state
    state: Riscv64State,
}

impl NativeRv64Executor {
    /// Create a new native RV64 executor
    pub fn new() -> Result<Self> {
        let device = crate::backend::drm::amdgpu::device::AmdGpuDevice::open_first()?;

        Ok(Self {
            device,
            ram_buffer: None,
            state_buffer: None,
            console_buffer: None,
            shader_module: None,
            state: Riscv64State::default(),
        })
    }

    /// Load a program from an .rts.png file
    pub fn load_program(&mut self, path: impl AsRef<Path>) -> Result<()> {
        // Load the PNG and extract pixel data
        let img = image::open(path.as_ref())?;
        let rgba = img.to_rgba8();
        let (width, height) = rgba.dimensions();

        // Calculate RAM size needed
        let ram_size = (width * height * 4) as u64;

        // Allocate VRAM for program
        self.ram_buffer = Some(self.device.alloc_buffer(ram_size, true)?);

        // Upload program to VRAM
        self.device.write_buffer(
            self.ram_buffer.unwrap(),
            0,
            rgba.as_raw(),
        )?;

        // Allocate state buffer
        let state_size = std::mem::size_of::<Riscv64State>() as u64;
        self.state_buffer = Some(self.device.alloc_buffer(state_size, false)?);

        // Initialize state
        self.state = Riscv64State::new(0x80000000); // Entry at RAM base
        self.device.write_buffer(
            self.state_buffer.unwrap(),
            0,
            unsafe {
                std::slice::from_raw_parts(
                    &self.state as *const Riscv64State as *const u8,
                    std::mem::size_of::<Riscv64State>(),
                )
            },
        )?;

        // Allocate console buffer (4KB)
        self.console_buffer = Some(self.device.alloc_buffer(4096, false)?);

        Ok(())
    }

    /// Compile the RV64 GLSL shader to SPIR-V
    pub fn compile_shader(&mut self) -> Result<()> {
        // Read GLSL source
        let glsl_source = include_str!("../shaders/riscv64_vm.glsl");

        // Compile to SPIR-V using naga
        let spirv_binary = compile_glsl_to_spirv(glsl_source, ())?;

        // Upload shader to GPU
        self.shader_module = Some(self.device.create_shader(&spirv_binary)?);

        Ok(())
    }

    /// Execute for a specified number of cycles
    pub fn execute(&mut self, max_cycles: u32) -> Result<Riscv64State> {
        if self.ram_buffer.is_none() {
            anyhow::bail!("No program loaded");
        }

        // Get buffer addresses for push constants
        let ram_addr = self.device.get_buffer_address(self.ram_buffer.unwrap())?;
        let state_addr = self.device.get_buffer_address(self.state_buffer.unwrap())?;
        let console_addr = self.device.get_buffer_address(self.console_buffer.unwrap())?;

        let push_constants = Rv64PushConstants {
            ram_addr,
            state_addr,
            console_addr,
            ram_size: 1024 * 1024 * 1024, // 1GB max
            max_cycles,
            _padding: 0,
        };

        // Dispatch compute shader
        let push_bytes = unsafe {
            std::slice::from_raw_parts(
                &push_constants as *const Rv64PushConstants as *const u8,
                std::mem::size_of::<Rv64PushConstants>(),
            )
        };
        self.device.dispatch_compute(
            self.shader_module.unwrap(),
            push_bytes,
            1, 1, 1,  // Single workgroup for now
        )?;

        // Read back state
        self.device.read_buffer(
            self.state_buffer.unwrap(),
            0,
            unsafe {
                std::slice::from_raw_parts_mut(
                    &mut self.state as *mut Riscv64State as *mut u8,
                    std::mem::size_of::<Riscv64State>(),
                )
            },
        )?;

        Ok(self.state)
    }

    /// Read console output
    pub fn read_console(&self) -> Result<Vec<u8>> {
        let mut buffer = vec![0u8; 4096];
        self.device.read_buffer(
            self.console_buffer.unwrap(),
            0,
            &mut buffer,
        )?;
        Ok(buffer)
    }
}

/// Compile GLSL to SPIR-V using naga
fn compile_glsl_to_spirv(source: &str, _kind: ()) -> Result<Vec<u32>> {
    use naga::front::glsl;
    use naga::back::spv;

    let mut parser = glsl::Frontend::default();
    let options = glsl::Options {
        stage: naga::ShaderStage::Compute,
        defines: naga::FastHashMap::default(),
    };
    
    let module = parser.parse(&options, source)
        .map_err(|e| anyhow::anyhow!("GLSL Parse Error: {:?}", e))?;

    let mut validator = naga::valid::Validator::new(
        naga::valid::ValidationFlags::all(),
        naga::valid::Capabilities::all(),
    );
    let info = validator.validate(&module)
        .map_err(|e| anyhow::anyhow!("Validation Error: {:?}", e))?;

    let spv_options = spv::Options {
        lang_version: (1, 3),
        flags: spv::WriterFlags::empty(),
        ..Default::default()
    };
    
    let spirv = spv::write_vec(&module, &info, &spv_options, None)
        .map_err(|e| anyhow::anyhow!("SPIR-V Write Error: {:?}", e))?;

    Ok(spirv)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_state_size() {
        // Verify state struct matches GLSL layout
        assert_eq!(std::mem::size_of::<Riscv64State>(), 64 * 21 + 8);
    }
}
