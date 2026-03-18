// ============================================
// WAVE PROPAGATION - 2D Wave Equation Solver
// ============================================
// Implements 2D wave equation propagation using finite difference method.
// Used by Wave-Logic Unit (WLU) for analog computing via wave interference.
//
// Wave Equation: ∂²u/∂t² = c² * ∇²u
// Discrete Form: u_new = 2*u - u_prev + c² * Δt² * laplacian(u)
// With Damping: u_new = damping * (2*u - u_prev + c² * Δt² * laplacian(u))

// --- Structs ---

/// Oscillator configuration
struct Oscillator {
    position_x: u32,
    position_y: u32,
    frequency: f32,
    phase: f32,
    amplitude: f32,
    _padding: u32,
    _padding2: u32,
}

/// Uniform configuration for wave simulation
struct WaveUniforms {
    grid_size: u32,           // Width/height of the wave tank (power of 2)
    wave_speed: f32,          // Wave propagation speed (c)
    damping: f32,             // Damping factor (0.0-1.0, typically ~0.995)
    max_amplitude: f32,       // Maximum wave amplitude for clamping
    dt: f32,                  // Time step (Δt)
    current_time: f32,        // Current simulation time for oscillator phase
    sensor_pos_x: u32,        // Sensor X position
    sensor_pos_y: u32,        // Sensor Y position
    _padding: u32,
}

/// Output from the wave simulation
struct WaveOutput {
    sensor_value: f32,        // Current value at sensor position
    _padding1: u32,
    _padding2: u32,
    _padding3: u32,
}

// --- Bindings ---

// Input wave fields (previous and current states)
@group(0) @binding(0) var<storage, read> previous_field: array<f32>;
@group(0) @binding(1) var<storage, read> current_field: array<f32>;

// Oscillators (up to 2 for now, matching CPU implementation)
@group(0) @binding(2) var<storage, read> oscillators: array<Oscillator>;

// Output field (new wave state)
@group(0) @binding(3) var<storage, read_write> new_field: array<f32>;

// Uniforms and output
@group(0) @binding(4) var<uniform> uniforms: WaveUniforms;
@group(0) @binding(5) var<storage, read_write> output: WaveOutput;

// --- Helper Functions ---

/// Convert 2D coordinates to linear index
fn coord_to_index(x: u32, y: u32, grid_size: u32) -> u32 {
    return y * grid_size + x;
}

/// Check if coordinates are within bounds
fn is_in_bounds(x: u32, y: u32, grid_size: u32) -> bool {
    return x > 0u && x < grid_size - 1u && y > 0u && y < grid_size - 1u;
}

/// Compute 5-point Laplacian: ∇²u = u(x+1,y) + u(x-1,y) + u(x,y+1) + u(x,y-1) - 4*u(x,y)
fn compute_laplacian(x: u32, y: u32, grid_size: u32) -> f32 {
    let idx = coord_to_index(x, y, grid_size);
    let idx_left = coord_to_index(x - 1u, y, grid_size);
    let idx_right = coord_to_index(x + 1u, y, grid_size);
    let idx_up = coord_to_index(x, y - 1u, grid_size);
    let idx_down = coord_to_index(x, y + 1u, grid_size);
    
    let center = current_field[idx];
    let left = current_field[idx_left];
    let right = current_field[idx_right];
    let up = current_field[idx_up];
    let down = current_field[idx_down];
    
    return (right + left + down + up) - 4.0 * center;
}

/// Compute oscillator value at current time
fn compute_oscillator_value(osc: Oscillator, time: f32) -> f32 {
    let angle = 2.0 * 3.14159265359 * osc.frequency * time + osc.phase;
    return osc.amplitude * sin(angle);
}

// --- Main Wave Propagation Kernel ---

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let x = global_id.x;
    let y = global_id.y;
    let grid_size = uniforms.grid_size;
    
    // Bounds check
    if (x >= grid_size || y >= grid_size) {
        return;
    }
    
    let idx = coord_to_index(x, y, grid_size);
    
    // Apply oscillators first (override field values at oscillator positions)
    for (var i = 0u; i < 2u; i++) {
        let osc = oscillators[i];
        if (x == osc.position_x && y == osc.position_y) {
            let osc_value = compute_oscillator_value(osc, uniforms.current_time);
            new_field[idx] = osc_value;
            return;
        }
    }
    
    // For boundary cells, just copy the current value (fixed boundary)
    if (!is_in_bounds(x, y, grid_size)) {
        new_field[idx] = current_field[idx];
        return;
    }
    
    // Compute wave equation for interior cells
    // u_new = damping * (2*u - u_prev + c² * Δt² * laplacian(u))
    
    let c2 = uniforms.wave_speed * uniforms.wave_speed;
    let dt2 = uniforms.dt * uniforms.dt;
    let laplacian = compute_laplacian(x, y, grid_size);
    
    let u_current = current_field[idx];
    let u_previous = previous_field[idx];
    
    var u_new = uniforms.damping * (
        2.0 * u_current - u_previous + c2 * dt2 * laplacian
    );
    
    // Clamp to max amplitude
    u_new = clamp(u_new, -uniforms.max_amplitude, uniforms.max_amplitude);
    
    new_field[idx] = u_new;
    
    // Read sensor value if this is the sensor position
    if (x == uniforms.sensor_pos_x && y == uniforms.sensor_pos_y) {
        output.sensor_value = u_new;
    }
}

// ============================================
// IMPLEMENTATION NOTES
// ============================================
// 
// This shader implements TODO-1/5 of the Wave Logic Unit GPU implementation.
//
// Algorithm:
// 1. Each thread processes one cell in the 2D wave tank
// 2. Oscillators override their positions with sinusoidal wave sources
// 3. Interior cells compute wave propagation using finite difference
// 4. Boundary cells maintain fixed boundary conditions
// 5. Sensor position reads and outputs the wave amplitude
//
// Performance:
// - Workgroup size 16x16 = 256 threads per workgroup
// - Optimized for 256x256 grid (matches default WLUConfig)
// - Each thread reads 5 values (center + 4 neighbors) for Laplacian
//
// Integration with DRM backend:
// - Requires buffer binding for 3 fields (prev, current, new)
// - Double-buffering: swap prev/current after each update
// - Oscillators and uniforms need separate uniform/storage buffers
// - Sensor output needs small readback buffer
//
// Next steps (TODO-2/5 through TODO-5/5):
// - TODO-2/5: Allocate GPU buffers for wave fields
// - TODO-3/5: Update oscillator position/frequency buffers
// - TODO-4/5: Implement sensor value readback from GPU
// - TODO-5/5: Wire up dispatch and integration with DRM backend
