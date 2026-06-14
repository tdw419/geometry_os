// ============================================
// OPTICAL HYPERVISOR - The Image is the Computer
// ============================================
// GPU Compute Shader implementation of the Tensor Pixel Protocol (TPP)
// Executes geometry_os.rts as the primary computing substrate.
//
// Architecture: "Liquid State Architecture"
// - Data evolves via Light (GPU compute shader)
// - The PNG image IS the RAM
// - Each pixel is a 4-dimensional tensor (R,G,B,A)
//
// Tensor Pixel Protocol (TPP):
// - R (Opcode): The Neural Weight / Instruction Class
// - G (Activation): The Data Payload / Signal Strength
// - B (Synapse): The Pointer / Hilbert Distance to next connection
// - A (State): Metadata (Allocated, Dirty, Locked, Executable)

// --- Constants & Bindings ---

struct OpticalHypervisorUniforms {
    cycle_count: u32,      // Current cycle number
    texture_size: u32,     // Width/Height (assumed square)
    hilbert_order: u32,    // Order of Hilbert curve (log2 of texture_size)
    entropy_seed: f32,     // Random seed for entropy drift
    _padding: f32,
};

@group(0) @binding(0) var<uniform> uniforms: OpticalHypervisorUniforms;

// Input/Output: The RTS substrate (read-write storage texture)
// Each pixel is a tensor: vec4<f32>(opcode, activation, synapse, state)
@group(0) @binding(1) var substrate: texture_storage_2d<rgba32float, read_write>;



// --- Hilbert Curve Math ---
// Maps 1D index to 2D (x,y) preserving locality.
// Essential for accessing the linearized memory stored in a 2D texture.

fn rot(n: u32, x: ptr<function, u32>, y: ptr<function, u32>, rx: u32, ry: u32) {
    if (ry == 0u) {
        if (rx == 1u) {
            *x = n - 1u - *x;
            *y = n - 1u - *y;
        }
        // Swap x and y
        let t = *x;
        *x = *y;
        *y = t;
    }
}

fn d2xy(n: u32, d: u32) -> vec2<u32> {
    var rx: u32;
    var ry: u32;
    var s: u32 = 1u;
    var t = d;
    var x: u32 = 0u;
    var y: u32 = 0u;

    // Iterate based on hilbert_order (max 16 for 65536x65536 texture)
    for (var i = 0u; i < 16u; i = i + 1u) {
        if (s >= n) { break; }
        
        rx = 1u & (t / 2u);
        ry = 1u & (t ^ rx);
        rot(s, &x, &y, rx, ry);
        x = x + s * rx;
        y = y + s * ry;
        t = t / 4u;
        s = s * 2u;
    }
    
    return vec2<u32>(x, y);
}

fn xy2d(n: u32, arg_x: u32, arg_y: u32) -> u32 {
    var x = arg_x;
    var y = arg_y;
    var rx: u32;
    var ry: u32;
    var d: u32 = 0u;
    var s: u32 = 1u;
    
    for (var i = 0u; i < 16u; i = i + 1u) {
        if (s >= n) { break; }
        
        rx = 1u & (x / s);
        ry = 1u & (y / s);
        d = d + s * s * ((3u * rx) ^ ry);
        rot(s, &x, &y, rx, ry);
        s = s * 2u;
    }
    
    return d;
}

// --- Tensor Pixel Protocol Functions ---

// State flags (stored in Alpha channel)
const FLAG_ALLOCATED: f32 = 1.0;
const FLAG_DIRTY: f32 = 2.0;
const FLAG_ACCESSED: f32 = 4.0;
const FLAG_LEAKED: f32 = 8.0;
const FLAG_EXEC: f32 = 16.0;

// Check if a pixel is executable code
fn is_code_pixel(pixel: vec4<f32>) -> bool {
    // Code segment is typically cyan/blueish in our simulation
    // R < 50 (low red), G > 50 (medium green), B > 100 (high blue)
    return (pixel.r < 0.2) && (pixel.g > 0.2) && (pixel.b > 0.4);
}

// Check if a pixel is heap memory
fn is_heap_pixel(pixel: vec4<f32>) -> bool {
    // Heap: Greenish (50, 200+, 50)
    return (pixel.r > 0.2) && (pixel.g > 0.4) && (pixel.b < 0.4);
}

// Execute a single instruction cycle on a tensor pixel
fn execute_instruction(pixel: vec4<f32>, cycle: u32) -> vec4<f32> {
    var result = pixel;
    
    // Decode tensor pixel
    let opcode = pixel.r;
    let activation = pixel.g;
    let synapse = pixel.b;
    let state = pixel.a;
    
    // Check if this is executable code
    if (is_code_pixel(pixel)) {
        // Simulate "Execution" - Lighting up the pixel (Access Flag)
        // Increase brightness slightly to show "Heat"
        result.r = min(1.0, opcode + 0.04);  // +10/255 ≈ 0.04
        result.g = min(1.0, activation + 0.02);  // +5/255 ≈ 0.02
        result.a = FLAG_ACCESSED;  // Mark as accessed
        
        // Logic: If Green > 150, Jump
        if (activation > 0.588) {  // 150/255 ≈ 0.588
            // Jump logic is handled at the dispatch level
            // We just mark that a jump should occur
            result.b = 1.0;  // Signal jump
        }
    }
    
    return result;
}

// --- Main Optical Hypervisor Compute Shader ---

@compute @workgroup_size(16, 16)
fn main_optical_hypervisor(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let x = global_id.x;
    let y = global_id.y;
    
    let texture_size = uniforms.texture_size;
    
    // Boundary check
    if (x >= texture_size || y >= texture_size) {
        return;
    }
    
    // 1. Read current tensor pixel from substrate
    var pixel = textureLoad(substrate, vec2<i32>(i32(x), i32(y)));
    
    // 2. Convert to Hilbert index for linear addressing
    let linear_index = xy2d(texture_size, x, y);
    
    // 3. Execute instruction if this is code
    if (is_code_pixel(pixel)) {
        let synapse = pixel.b;
        pixel = execute_instruction(pixel, uniforms.cycle_count);
        
        // Jump logic: If activation is high, "jump" to a new location
        if (pixel.b >= 1.0) {
            // Calculate jump target based on activation value
            let jump_distance = u32(pixel.g * 255.0);
            let target_index = (linear_index + jump_distance) % (texture_size * texture_size);
            let target_coord = d2xy(texture_size, target_index);
            
            // Read target pixel and modify it
            var target_pixel = textureLoad(substrate, vec2<i32>(i32(target_coord.x), i32(target_coord.y)));
            
            // Simulate heap access
            if (is_heap_pixel(target_pixel)) {
                target_pixel.a = FLAG_ACCESSED;  // Mark as accessed
                target_pixel.g = min(1.0, target_pixel.g + 0.1);  // Increase brightness
                textureStore(substrate, vec2<i32>(i32(target_coord.x), i32(target_coord.y)), target_pixel);
            }
            
            // Reset jump signal
            pixel.b = synapse;  // Restore original synapse value
        }
    }
    
    // 4. Entropy Drift (Simulate "Memory Decay" or background processes)
    // Randomly mutate pixels based on entropy seed
    if ((uniforms.cycle_count % 100u) == 0u) {
        let pseudo_random = fract(sin(f32(linear_index) * uniforms.entropy_seed) * 43758.5453);
        
        if (pseudo_random < 0.01) {  // 1% chance of mutation
            if (is_heap_pixel(pixel)) {
                // "Touch" the heap
                pixel.a = FLAG_ACCESSED;
                pixel.g = min(1.0, pixel.g + 0.05);
            }
        }
    }
    
    // 5. Write evolved state back to substrate
    textureStore(substrate, vec2<i32>(i32(x), i32(y)), pixel);
}

// --- Visualization Mode ---
// Renders the substrate for debugging/visualization

@compute @workgroup_size(16, 16)
fn main_visualize(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let x = global_id.x;
    let y = global_id.y;
    
    let texture_size = uniforms.texture_size;
    
    if (x >= texture_size || y >= texture_size) {
        return;
    }
    
    // Read pixel
    var pixel = textureLoad(substrate, vec2<i32>(i32(x), i32(y)));
    
    // Enhance visualization based on state
    if (pixel.a >= FLAG_ACCESSED) {
        // Add a subtle glow to accessed pixels
        pixel = pixel * 1.1;
    }
    
    // Write back
    textureStore(substrate, vec2<i32>(i32(x), i32(y)), pixel);
}

// --- Heat Map Generation ---
// Generates a heat map showing execution activity

@compute @workgroup_size(16, 16)
fn main_heatmap(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let x = global_id.x;
    let y = global_id.y;
    
    let texture_size = uniforms.texture_size;
    
    if (x >= texture_size || y >= texture_size) {
        return;
    }
    
    let pixel = textureLoad(substrate, vec2<i32>(i32(x), i32(y)));
    
    // Calculate heat based on access patterns
    var heat = 0.0;
    
    if (pixel.a >= FLAG_ACCESSED) {
        heat = 0.5;
    }
    
    if (pixel.a >= FLAG_DIRTY) {
        heat = 0.75;
    }
    
    if (pixel.a >= FLAG_EXEC) {
        heat = 1.0;
    }
    
    // Create heat map visualization
    var heatmap_color = vec4<f32>(heat, heat * 0.5, 1.0 - heat, 1.0);
    
    textureStore(substrate, vec2<i32>(i32(x), i32(y)), heatmap_color);
}

// --- Memory Statistics ---
// Computes statistics about the substrate state

struct MemoryStats {
    total_pixels: u32,
    code_pixels: u32,
    heap_pixels: u32,
    accessed_pixels: u32,
    dirty_pixels: u32,
};

@group(0) @binding(3) var<storage, read_write> stats_buffer: array<atomic<u32>>;

@compute @workgroup_size(256, 1, 1)
fn main_statistics(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;
    let texture_size = uniforms.texture_size;
    let total_pixels = texture_size * texture_size;
    
    if (idx >= total_pixels) {
        return;
    }
    
    // Convert linear index to 2D coordinates
    let coord = d2xy(texture_size, idx);
    let pixel = textureLoad(substrate, vec2<i32>(i32(coord.x), i32(coord.y)));
    
    // Initialize local counters
    var code_count: u32 = 0u;
    var heap_count: u32 = 0u;
    var accessed_count: u32 = 0u;
    var dirty_count: u32 = 0u;
    
    // Classify pixel
    if (is_code_pixel(pixel)) {
        code_count = 1u;
    } else if (is_heap_pixel(pixel)) {
        heap_count = 1u;
    }
    
    if (pixel.a >= FLAG_ACCESSED) {
        accessed_count = 1u;
    }
    
    if (pixel.a >= FLAG_DIRTY) {
        dirty_count = 1u;
    }
    
    // Atomic add to global statistics
    atomicAdd(&stats_buffer[0], 1u);  // total_pixels
    atomicAdd(&stats_buffer[1], code_count);
    atomicAdd(&stats_buffer[2], heap_count);
    atomicAdd(&stats_buffer[3], accessed_count);
    atomicAdd(&stats_buffer[4], dirty_count);
}
