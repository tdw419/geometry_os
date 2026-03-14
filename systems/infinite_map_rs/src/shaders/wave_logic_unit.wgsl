// Wave-Logic Unit (WLU) - Analog Computing Prototype
// Implements constructive/destructive interference as logic gates
// Input: Two wave emitters (oscillators) at specific frequencies/phases
// Medium: 2D wave tank (continuous field)
// Output: Sensor detects interference pattern (logic HIGH/LOW)

// ============================================================================
// CONSTANTS
// ============================================================================

const DAMPING: f32 = 0.995f32;

// ============================================================================
// DATA STRUCTURES
// ============================================================================

// We'll use two storage buffers for the wave field (ping-pong)
// and a small storage buffer for the output (sensor value and logic output)

// ============================================================================
// BINDINGS
// ============================================================================

@group(0) @binding(0) var<storage, read> input_field: array<f32>;
@group(0) @binding(1) var<storage, read_write> output_field: array<f32>;
@group(0) @binding(2) var<storage, read_write> result_output: array<f32>; // [sensor_value, logic_output]
@group(0) @binding(3) var<uniform> params: array<f32, 21];

// ============================================================================
// HELPER FUNCTIONS
// ============================================================================

/// Simple 2D Laplacian using 5-point stencil
fn laplacian(field: &array<f32>, grid_size: u32, x: u32, y: u32) -> f32 {
    let mut sum: f32 = 0.0;
    let mut count: u32 = 0;
    let idx = y * grid_size + x;
    
    // Left neighbor
    if x > 0 {
        let left_idx = y * grid_size + (x - 1);
        sum += field[left_idx];
        count += 1;
    }
    // Right neighbor
    if x < grid_size - 1 {
        let right_idx = y * grid_size + (x + 1);
        sum += field[right_idx];
        count += 1;
    }
    // Top neighbor
    if y > 0 {
        let top_idx = (y - 1) * grid_size + x;
        sum += field[top_idx];
        count += 1;
    }
    // Bottom neighbor
    if y < grid_size - 1 {
        let bottom_idx = (y + 1) * grid_size + x;
        sum += field[bottom_idx];
        count += 1;
    }
    // Center point (weighted negatively)
    sum -= 4.0 * field[idx];
    
    return sum / max(count as f32, 1.0);
}

/// Apply wave equation: new = current + dt^2 * c^2 * laplacian
fn update_wave_point(current: f32, laplac: f32, dt: f32, wave_speed_sq: f32) -> f32 {
    let mut new_value = current + wave_speed_sq * dt * dt * laplac;
    // Apply damping
    new_value *= DAMPING;
    return new_value;
}

// ============================================================================
// MAIN COMPUTE SHADER
// ============================================================================

@compute @workgroup_size(16, 16)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let x = global_id.x;
    let y = global_id.y;
    let grid_size = params[16] as u32;
    
    // Only process if within bounds
    if x >= grid_size || y >= grid_size {
        return;
    }
    
    let idx = y * grid_size + x;
    let current = input_field[idx];
    
    // Compute laplacian
    let laplac = laplacian(&input_field, grid_size, x, y);
    
    // Wave speed squared
    let wave_speed = params[12];
    let wave_speed_sq = wave_speed * wave_speed;
    
    // Time step (hardcoded for 60 FPS)
    let dt = 0.016;
    
    // Update wave point
    let mut new_value = update_wave_point(current, laplac, dt, wave_speed_sq);
    
    // Apply oscillator contributions (only at their specific positions)
    let osc_a_pos_x = params[0] as u32;
    let osc_a_pos_y = params[1] as u32;
    let osc_a_frequency = params[2];
    let osc_a_phase = params[3];
    let osc_a_amplitude = params[4];
    
    let osc_b_pos_x = params[5] as u32;
    let osc_b_pos_y = params[6] as u32;
    let osc_b_frequency = params[7];
    let osc_b_phase = params[8];
    let osc_b_amplitude = params[9];
    
    let sensor_pos_x = params[10] as u32;
    let sensor_pos_y = params[11] as u32;
    
    // Add oscillator contributions at their positions
    if x == osc_a_pos_x && y == osc_a_pos_y {
        // Simple sine wave oscillation
        let oscillation = osc_a_amplitude * (osc_a_phase).sin();
        new_value += oscillation * 0.1;
    }
    if x == osc_b_pos_x && y == osc_b_pos_y {
        let oscillation = osc_b_amplitude * (osc_b_phase).sin();
        new_value += oscillation * 0.1;
    }
    
    // Write the new value to the output field
    output_field[idx] = new_value;
    
    // At the sensor position, compute the logic output
    // We'll write the sensor value and logic output to the first two elements of result_output
    if x == sensor_pos_x && y == sensor_pos_y && global_id.x == 0 && global_id.y == 0 {
        // Only one thread writes the result to avoid race conditions
        result_output[0] = new_value;  // sensor value
        if new_value > params[13] {  // params[13] is sensor_threshold
            result_output[1] = 1.0;  // logic HIGH
        } else {
            result_output[1] = 0.0;  // logic LOW
        }
    }
}