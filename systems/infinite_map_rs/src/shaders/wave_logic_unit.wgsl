// Wave-Logic Unit (WLU) - Analog Computing Prototype
// Implements constructive/destructive interference as logic gates
// Input: Two wave emitters (oscillators) at specific frequencies/phases
// Medium: 2D wave tank (continuous field)
// Output: Sensor detects interference pattern (logic HIGH/LOW)

// ============================================================================
// CONSTANTS
// ============================================================================

const GRID_SIZE: u32 = 256u;           // Wave tank dimensions
const WAVE_SPEED: f32 = 0.1f32;        // Wave propagation speed
const DAMPING: f32 = 0.995f32;         // Energy loss per cycle
const MAX_AMPLITUDE: f32 = 1.0f32;     // Maximum wave height
const SENSOR_THRESHOLD: f32 = 0.5f32;  // Threshold for logic detection

// Oscillator configurations (would be set via uniforms or texture)
const OSCILLATOR_A_POS: vec2<u32> = vec2<u32>(64u, 128u);
const OSCILLATOR_B_POS: vec2<u32> = vec2<u32>(192u, 128u);
const SENSOR_POS: vec2<u32> = vec2<u32>(128u, 128u);

// ============================================================================
// DATA STRUCTURES
// ============================================================================

/// Current wave field state (height/amplitude at each point)
struct WaveField {
    current: array<array<f32, 256>, 256>,   // Current wave heights
    previous: array<array<f32, 256>, 256>,  // Previous wave heights (for velocity)
}

/// Oscillator state (position, frequency, phase)
struct Oscillator {
    position: vec2<u32>,
    frequency: f32,
    phase: f32,
    amplitude: f32,
}

/// WLU state containing everything needed for computation
struct WLUState {
    field: WaveField,
    oscillator_a: Oscillator,
    oscillator_b: Oscillator,
    sensor_value: f32,
    logic_output: u32,  // 0 = LOW, 1 = HIGH
    frame: u32,
}

// ============================================================================
// HELPER FUNCTIONS
// ============================================================================

/// Simple 2D Laplacian using 5-point stencil
fn laplacian(field: &WaveField, x: u32, y: u32) -> f32 {
    let mut sum: f32 = 0.0;
    let mut count: u32 = 0;
    
    // Left neighbor
    if x > 0 {
        sum += field.current[x-1][y];
        count += 1;
    }
    // Right neighbor
    if x < GRID_SIZE - 1 {
        sum += field.current[x+1][y];
        count += 1;
    }
    // Top neighbor
    if y > 0 {
        sum += field.current[x][y-1];
        count += 1;
    }
    // Bottom neighbor
    if y < GRID_SIZE - 1 {
        sum += field.current[x][y+1];
        count += 1;
    }
    // Center point (weighted negatively)
    sum -= 4.0 * field.current[x][y];
    
    return sum / max(count as f32, 1.0);
}

/// Apply wave equation: new = 2*current - previous + c^2 * laplacian
fn update_wave_point(field: &mut WaveField, x: u32, y: u32, dt: f32) -> f32 {
    let laplac = laplacian(field, x, y);
    let wave_speed_sq = WAVE_SPEED * WAVE_SPEED;
    let new_value = 2.0 * field.current[x][y] - field.previous[x][y] + 
                    wave_speed_sq * dt * dt * laplac;
    
    // Apply damping
    return new_value * DAMPING;
}

/// Add oscillator contribution to wave field
fn apply_oscillator(field: &mut WaveField, osc: &Oscillator, time: f32) {
    let x = osc.position.x;
    let y = osc.position.y;
    
    // Simple sine wave oscillation
    let oscillation = osc.amplitude * 
                     (osc.frequency * time + osc.phase).sin();
    
    // Add to current field (with some spatial spread)
    field.current[x][y] += oscillation * 0.1;
    
    // Also add to nearby points for spatial spread
    if x > 0 { field.current[x-1][y] += oscillation * 0.05; }
    if x < GRID_SIZE - 1 { field.current[x+1][y] += oscillation * 0.05; }
    if y > 0 { field.current[x][y-1] += oscillation * 0.05; }
    if y < GRID_SIZE - 1 { field.current[x][y+1] += oscillation * 0.05; }
}

// ============================================================================
// BINDINGS
// ============================================================================

@group(0) @binding(0) var<storage, read_write> wlu_state: WLUState;
@group(0) @binding(1) var<uniform> time: f32;

// ============================================================================
// MAIN COMPUTE SHADER
// ============================================================================

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let x = global_id.x;
    let y = global_id.y;
    
    // Only process if within bounds
    if x >= GRID_SIZE || y >= GRID_SIZE {
        return;
    }
    
    // Load current state (would typically be done in a separate pass)
    // For simplicity, we're doing read-modify-write in one shader
    // In practice, you'd ping-pong between two textures
    
    // Update wave field using finite difference method
    let new_height = update_wave_point(&mut wlu_state.field, x, y, 0.016); // ~60 FPS
    
    // Store new height (in real implementation, would write to separate texture)
    // For now, we'll just update the current field directly
    wlu_state.field.previous[x][y] = wlu_state.field.current[x][y];
    wlu_state.field.current[x][y] = new_height;
    
    // Apply oscillators (only at their specific positions)
    if x == wlu_state.oscillator_a.position.x && y == wlu_state.oscillator_a.position.y {
        apply_oscillator(&mut wlu_state.field, &wlu_state.oscillator_a, time);
    }
    if x == wlu_state.oscillator_b.position.x && y == wlu_state.oscillator_b.position.y {
        apply_oscillator(&mut wlu_state.field, &wlu_state.oscillator_b, time);
    }
    
    // Read sensor value (only at sensor position)
    if x == wlu_state.sensor_position.x && y == wlu_state.sensor_position.y {
        wlu_state.sensor_value = wlu_state.field.current[x][y];
        
        // Determine logic output based on threshold
        if wlu_state.sensor_value > SENSOR_THRESHOLD {
            wlu_state.logic_output = 1u;  // Logic HIGH
        } else {
            wlu_state.logic_output = 0u;  // Logic LOW
        }
    }
    
    // Increment frame counter (only once)
    if x == 0 && y == 0 {
        wlu_state.frame = wlu_state.frame + 1u;
    }
}