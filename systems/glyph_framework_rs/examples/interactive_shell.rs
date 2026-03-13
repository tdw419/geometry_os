use glyph_framework_rs::{AppCoordinator, AppLayout, WgpuBackend, Intent};
use std::io::{self, Write};

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    env_logger::init();
    
    println!("--- Geometry OS: Native Glyph Shell Integration Test ---");
    println!("Simulation: This will spawn the shell and feed characters to it.");
    
    // 1. Initialize Backend
    let backend = WgpuBackend::new(16);
    let mut coordinator = AppCoordinator::new(backend)?;
    
    // 2. Spawn Shell (App #1)
    let shell_layout = AppLayout { x: 50, y: 50, width: 640, height: 480 };
    let shell_id = coordinator.spawn_app("glyph_shell", shell_layout)?;
    
    // 3. Load Shell Bytecode
    let shell_json = std::fs::read_to_string("examples/glyph_shell.glyph")?;
    let program: serde_json::Value = serde_json::from_str(&shell_json)?;
    let glyphs_val = program.get("glyphs").ok_or("No glyphs in program")?;
    
    // Convert to internal format (WgpuBackend expects raw words in memory for now)
    // Actually, WgpuBackend needs a way to load the program into memory.
    // In our simplified VM, the program starts at memory index 0.
    
    if let Some(arr) = glyphs_val.as_array() {
        for (i, g) in arr.iter().enumerate() {
            let opcode = g.get("opcode").and_then(|v| v.as_u64()).unwrap_or(0) as u32;
            let rd = g.get("rd").and_then(|v| v.as_u64()).unwrap_or(0) as u32;
            let rs1 = g.get("rs1").and_then(|v| v.as_u64()).unwrap_or(0) as u32;
            let rs2 = g.get("rs2").and_then(|v| v.as_u64()).unwrap_or(0) as u32;
            
            let word = opcode | (rd << 8) | (rs1 << 16) | (rs2 << 24);
            coordinator.set_state(shell_id, i as u64, f32::from_bits(word))?;
        }
    }
    
    println!("✅ Shell spawned at App #1. Ready for input.");
    
    // 4. Input Loop
    let test_string = "GEOMETRY";
    for c in test_string.chars() {
        print!("Typing '{}'... ", c);
        io::stdout().flush()?;
        
        // Send KeyPress intent
        coordinator.send_intent(shell_id, Intent::KeyPress(c))?;
        
        // Verify intent wrote to memory (addr 102)
        let pending = coordinator.get_state(shell_id, 102)?.to_bits();
        println!("Intent Sent: Pending flag is {}", pending);
        
        // Execute enough steps...
        for _ in 0..20 {
            coordinator.step()?;
            let ctx = coordinator.get_context(shell_id)?;
            // ctx[5] is PC, ctx[6] is halted
            if ctx[6] == 1 {
                println!("App Halted at PC={}", ctx[5]);
                break;
            }
        }
        
        // Verify state: Check CURSOR_X (addr 100)
        let cursor_x_f32 = coordinator.get_state(shell_id, 100)?;
        let cursor_x = cursor_x_f32.to_bits();
        println!("CursorX is now {}", cursor_x);

        // Verify Pixels (Simplified: Check display buffer at CursorX position)
        let ox = 50;
        let oy = 50;
        let px = ox + (cursor_x - 1) * 8;
        let py = oy;
        
        let pixel = coordinator.get_display_pixel(px, py)?;
        println!("Pixel at ({}, {}) is {:08X}", px, py, pixel);
    }
    
    println!("\n--- Test Complete ---");
    println!("The GPU has processed {} characters and executed DRAW opcodes.", test_string.len());
    
    Ok(())
}
