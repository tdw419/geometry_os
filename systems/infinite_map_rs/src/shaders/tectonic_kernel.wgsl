// Tectonic Kernel (Compute Shader)
// Phase 28: Visual Assembly Execution
// Treats the texture as a 2D memory space for WebAssembly execution.

@group(0) @binding(0) var input_texture: texture_2d<f32>;
@group(0) @binding(1) var output_texture: texture_storage_2d<rgba8unorm, write>;

// --- Virtual CPU Constants ---
const STACK_SIZE: u32 = 64;
const OP_NOP: u32 = 0x01;
const OP_BLOCK: u32 = 0x02;
const OP_LOOP: u32 = 0x03;
const OP_BR: u32 = 0x0C;
const OP_CONST_I32: u32 = 0x41;
const OP_ADD_I32: u32 = 0x6A;
const OP_SUB_I32: u32 = 0x6B;
const OP_MUL_I32: u32 = 0x6C;
const OP_GET_LOCAL: u32 = 0x20;
const OP_SET_LOCAL: u32 = 0x21;

// --- Shared State (Virtual Registers) ---
// One "Core" per Workgroup (16x16 pixels)
// This model mimics a Tectonic Plate: A cluster of pixels acting as a processor.
var<workgroup> stack: array<u32, 64>;
var<workgroup> sp: u32; // Stack Pointer
var<workgroup> ip: u32; // Instruction Pointer
var<workgroup> accumulator: u32;

// Helper to convert normalized float color to byte
fn f32_to_byte(v: f32) -> u32 {
    return u32(v * 255.0);
}

// Fetch a byte from 2D texture using linear address (scanline order for now)
// In full Tectonic, this would use Hilbert Curve mapping.
fn fetch_byte(addr: u32, width: u32) -> u32 {
    let y = addr / width;
    let x = addr % width;
    let color = textureLoad(input_texture, vec2<i32>(i32(x), i32(y)), 0);
    // WASM code is in Red channel
    return f32_to_byte(color.r);
}

@compute @workgroup_size(16, 16)
fn update_system(@builtin(global_invocation_id) global_id: vec3<u32>, @builtin(local_invocation_id) local_id: vec3<u32>) {
    let dims = textureDimensions(input_texture);
    let width = u32(dims.x);
    let height = u32(dims.y);
    
    // 1. Initialization (Single Thread per Core/Workgroup)
    // Only thread (0,0) in the workgroup acts as the Control Unit
    if (local_id.x == 0u && local_id.y == 0u) {
        // Initialize State (In reality, we'd load this from a State Pixel)
        if (ip == 0u) { 
            sp = 0u; 
            ip = 38u; // Entry Point for matmul.vasm (Skip WASM Header)
        }
        
        // Execute Batch of Instructions (50 cycles per frame)
        for (var cycle = 0u; cycle < 50u; cycle = cycle + 1u) {
            // --- FETCH ---
            let opcode = fetch_byte(ip, width);
            ip = ip + 1u;
            
            // --- DECODE & EXECUTE ---
            switch (opcode) {
                case OP_CONST_I32: {
                    // Mock Immediate Load: READ NEXT BYTE
                    let val = fetch_byte(ip, width); 
                    ip = ip + 1u;
                    // Push
                    if (sp < STACK_SIZE) {
                        stack[sp] = val;
                        sp = sp + 1u;
                    }
                }
                case OP_ADD_I32: {
                    // Pop B, Pop A
                    if (sp >= 2u) {
                        sp = sp - 1u;
                        let b = stack[sp];
                        sp = sp - 1u;
                        let a = stack[sp];
                        let result = a + b;
                        // Push Result
                        stack[sp] = result;
                        sp = sp + 1u;
                        accumulator = result; // Visualize this!
                    }
                }
                case OP_MUL_I32: {
                    // Pop B, Pop A
                    if (sp >= 2u) {
                        sp = sp - 1u;
                        let b = stack[sp];
                        sp = sp - 1u;
                        let a = stack[sp];
                        let result = a * b;
                        // Push Result
                        stack[sp] = result;
                        sp = sp + 1u;
                        accumulator = result;
                    }
                }
                case OP_NOP: {
                    // Do nothing
                }
                default: {
                    // Unknown 
                }
            }
            
            // Safety break for bounds (optional)
            if (ip >= width * height) { break; }
        }
    }
    
    workgroupBarrier(); // Sync
    
    // 2. Visualization (All Threads)
    // Render the state of the machine to the texture
    
    let coords = vec2<i32>(global_id.xy);
    if (u32(coords.x) >= width || u32(coords.y) >= height) { return; }
    
    // Default: Preserve existing pixel (Persistence)
    // var pixel = textureLoad(input_texture, coords, 0); // Read-only in compute? Can't read output.
    // Read previous frame
    var pixel = vec4<f32>(0.0, 0.0, 0.0, 1.0);
    let prev = textureLoad(input_texture, coords, 0);
    pixel = prev;
    
    // Visual Debugging:
    // If this pixel corresponds to the current IP, light it up WHITE
    let flat_idx = u32(coords.y) * width + u32(coords.x);
    
    if (flat_idx == ip) {
        pixel = vec4<f32>(1.0, 1.0, 1.0, 1.0); // IP Cursor
    } else if (flat_idx < ip) {
        // Trail (Executed) - Dim it
        pixel.g = pixel.g * 0.95; 
        pixel.b = pixel.b * 0.95;
    }
    
    // Visualize Accumulator (Result)
    // Map accumulator value to background color of the Workgroup
    // We can't easily color the whole workgroup background efficiently without bounds check
    // But we can set the pixel at (0,0) of the workgroup using the accumulator
    
    if (local_id.x == 0u && local_id.y == 1u) {
         // Output Register Visualization
         let val = f32(accumulator) / 255.0;
         pixel = vec4<f32>(0.0, val, 0.0, 1.0);
    }

    textureStore(output_texture, coords, pixel);
}
