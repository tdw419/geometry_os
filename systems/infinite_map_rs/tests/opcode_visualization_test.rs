//! Opcode Visualization Test
//!
//! Demonstrates visual rendering of GPU memory as opcode colors.
//! The shader maps each opcode to a semantic color:
//! - LDI/ALLOC = Cyan
//! - LOAD = Yellow
//! - STORE = Red
//! - ADD = Green
//! - BRANCH = Magenta
//! - HALT = White
//!
//! This enables "seeing" programs in memory - the bootloader
//! appears as a pattern of colored pixels.

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};

    fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
        opcode as u32
            | ((stratum as u32) << 8)
            | ((p1 as u32) << 16)
            | ((p2 as u32) << 24)
    }

    fn create_test_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            ..Default::default()
        });

        let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::default(),
            compatible_surface: None,
            force_fallback_adapter: false,
        }))?;

        let (device, queue) = pollster::block_on(adapter.request_device(
            &wgpu::DeviceDescriptor {
                label: Some("Opcode Visualization Test"),
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .ok()?;

        Some((Arc::new(device), Arc::new(queue)))
    }

    /// Get the semantic color for an opcode
    fn opcode_to_color(opcode: u32) -> (f32, f32, f32) {
        match opcode {
            0 => (0.2, 0.2, 0.2),     // NOP - Dark gray
            1 => (0.0, 1.0, 1.0),     // LDI - Cyan
            2 => (0.5, 0.5, 0.5),     // MOV - Gray
            3 => (1.0, 1.0, 0.0),     // LOAD - Yellow
            4 => (1.0, 0.0, 0.0),     // STORE - Red
            5 => (0.0, 1.0, 0.0),     // ADD - Green
            6 => (0.0, 0.8, 0.4),     // SUB - Sea green
            7 => (1.0, 0.5, 0.0),     // MUL - Orange
            10 => (0.8, 0.0, 0.8),    // BRANCH - Magenta
            13 => (1.0, 1.0, 1.0),    // HALT - White
            _ => (0.1, 0.1, 0.3),     // Unknown - Dim blue
        }
    }

    /// Generate ASCII art visualization of a program in memory
    fn visualize_program(opcodes: &[(u32, u32, &str)]) -> String {
        let mut output = String::new();
        output.push_str("\n  ┌");
        for _ in 0..40 {
            output.push('─');
        }
        output.push_str("┐\n");

        for &(addr, word, name) in opcodes {
            let opcode = word & 0xFF;
            let (r, g, b) = opcode_to_color(opcode);
            let color_name = if opcode == 1 { "Cyan" }
                           else if opcode == 3 { "Yellow" }
                           else if opcode == 4 { "Red" }
                           else if opcode == 5 { "Green" }
                           else if opcode == 10 { "Magenta" }
                           else if opcode == 13 { "White" }
                           else { "Gray" };

            output.push_str(&format!(
                "  │ {:4}: {:08X}  {:10}  {}\n",
                addr, word, name, color_name
            ));
        }

        output.push_str("  └");
        for _ in 0..40 {
            output.push('─');
        }
        output.push_str("┘\n");

        output
    }

    #[test]
    fn test_opcode_visualization() {
        println!("\n============================================================");
        println!("  OPCODE VISUALIZATION");
        println!("  Seeing Programs in Memory");
        println!("============================================================");

        // The self-replicating bootloader program
        let program: Vec<(u32, u32, &str)> = vec![
            (0, glyph(1, 0, 0, 0), "LDI r0"),
            (1, 0, "DATA: src=0"),
            (2, glyph(1, 0, 1, 0), "LDI r1"),
            (3, 100, "DATA: dst=100"),
            (4, glyph(1, 0, 2, 0), "LDI r2"),
            (5, 0, "DATA: cnt=0"),
            (6, glyph(1, 0, 3, 0), "LDI r3"),
            (7, 1, "DATA: inc=1"),
            (8, glyph(1, 0, 4, 0), "LDI r4"),
            (9, 18, "DATA: len=18"),
            (10, glyph(3, 0, 0, 5), "LOAD r5"),
            (11, glyph(4, 0, 1, 5), "STORE r5"),
            (12, glyph(5, 0, 3, 0), "ADD r0"),
            (13, glyph(5, 0, 3, 1), "ADD r1"),
            (14, glyph(5, 0, 3, 2), "ADD r2"),
            (15, glyph(10, 1, 2, 4), "BNE r2,r4"),
            (16, (-7i32) as u32, "OFFSET: -7"),
            (17, glyph(13, 0, 0, 0), "HALT"),
        ];

        println!("\n  Self-Replicating Bootloader (18 pixels):");
        let viz = visualize_program(&program);
        println!("{}", viz);

        // Legend
        println!("\n  Opcode Color Legend:");
        println!("  ┌────────────────────────────────────────┐");
        println!("  │  Cyan   = LDI (Load Immediate)         │");
        println!("  │  Yellow = LOAD (Read from memory)      │");
        println!("  │  Red    = STORE (Write to memory)      │");
        println!("  │  Green  = ADD (Arithmetic)             │");
        println!("  │  Magenta= BRANCH (Conditional jump)    │");
        println!("  │  White  = HALT (Stop execution)        │");
        println!("  │  Gray   = DATA (Immediate values)      │");
        println!("  └────────────────────────────────────────┘");

        // Visual pattern
        println!("\n  Visual Pattern (what you'd see on screen):");
        println!("  ┌──────────────────────────────────────────┐");
        println!("  │  ████████████████████░░░░░░░░░░░░░░░░░░░░ │");
        println!("  │  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │");
        println!("  │  Cyan=LDI Yellow=LOAD Red=STORE Green=ADD │");
        println!("  │  ...then Magenta=BNE loops back...        │");
        println!("  └──────────────────────────────────────────┘");

        println!("\n  ╔════════════════════════════════════════════════════════╗");
        println!("  ║  OPCODE VISUALIZATION READY.                          ║");
        println!("  ║                                                        ║");
        println!("  ║  The shader maps each pixel's opcode to a color.       ║");
        println!("  ║  Programs become visible patterns in memory.           ║");
        println!("  ║                                                        ║");
        println!("  ║  Next: Render to screen with PixiJS shell.             ║");
        println!("  ╚════════════════════════════════════════════════════════╝");
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_opcode_shader_compilation() {
        let (device, _queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("SKIP: No GPU available");
                return;
            }
        };

        println!("\n  Testing opcode visualizer shader compilation...");

        let shader_source = include_str!("../src/shaders/opcode_visualizer.wgsl");

        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Opcode Visualizer"),
            source: wgpu::ShaderSource::Wgsl(shader_source.into()),
        });

        // Create pipeline
        let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Opcode Visualizer Pipeline"),
            layout: None,
            module: &shader,
            entry_point: "main",
        });

        println!("  ✓ Shader compiled successfully");
        println!("  ✓ Pipeline created");

        // Verify bind group layout exists
        let _bind_group_layout = pipeline.get_bind_group_layout(0);
        println!("  ✓ Bind group layout 0 created");

        println!("\n  ╔════════════════════════════════════════════════════════╗");
        println!("  ║  OPCODE SHADER READY.                                 ║");
        println!("  ╚════════════════════════════════════════════════════════╝");
    }
}
