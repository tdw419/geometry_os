//! Neural State Visualization Shader
//! Renders neural activations, audio features, and input state as dynamic geometry

struct VertexOutput {
    @builtin(position) position: vec3<f32>,
    @location(0) frag_pos: vec4<f32>,
};

/// Neural state uniforms from Python cortex
struct NeuralUniforms {
    // Layer activations (8 values from neural cortex)
    layer_0: f32,
    layer_1: f32,
    layer_2: f32,
    layer_3: f32,
    layer_4: f32,
    layer_5: f32,
    layer_6: f32,
    layer_7: f32,
    
    // Audio features (from audio cortex)
    bass_energy: f32,
    treble_energy: f32,
    volume: f32,
    is_beat: f32,
    startle: f32,
    
    // Input state (from input cortex)
    velocity: f32,
    is_focused: f32,
    is_idle: f32,
    chaos: f32,
    
    // Derived metrics
    arousal: f32,
    valence: f32,
    entropy: f32,
    
    // Time for animation
    time: f32,
}

@group(0) @binding(0)
var<uniform> neural: NeuralUniforms;

@vertex
fn vs_main(@builtin(vertex) position: vec3<f32>) -> VertexOutput {
    var output: VertexOutput;
    output.position = position;
    output.frag_pos = vec4<f32>(position, 1.0);
    return output;
}

/// Calculate hue from valence (emotional state)
fn valence_to_hue(valence: f32) -> vec3<f32> {
    // Map valence (-1 to 1) to hue (0 to 1)
    let normalized_valence = clamp(valence, -1.0, 1.0) * 0.5 + 0.5;
    
    // Red for negative, Blue for positive, Green for neutral
    if (normalized_valence < 0.33) {
        // Negative: Red to Yellow
        return vec3<f32>(1.0, normalized_valence * 3.0, 0.0);
    } else if (normalized_valence < 0.66) {
        // Neutral: Yellow to Cyan
        return vec3<f32>(1.0 - (normalized_valence - 0.33) * 3.0, 1.0, 0.0);
    } else {
        // Positive: Cyan to Blue
        return vec3<f32>(0.0, 1.0, (normalized_valence - 0.66) * 3.0);
    }
}

/// Calculate saturation from arousal
fn arousal_to_saturation(arousal: f32) -> f32 {
    // Higher arousal = more saturated
    return clamp(arousal * 1.5, 0.3, 1.0);
}

/// Calculate brightness from entropy
fn entropy_to_brightness(entropy: f32) -> f32 {
    // Lower entropy = brighter (more focused)
    return 1.0 - entropy * 0.5;
}

/// Calculate pattern from layer activations
fn layer_pattern(pos: vec3<f32>) -> f32 {
    // Create interference pattern from layer activations
    let pattern1 = sin(pos.x * 10.0 + neural.layer_0 * 6.28) * 0.5 + 0.5;
    let pattern2 = cos(pos.y * 10.0 + neural.layer_1 * 6.28) * 0.5 + 0.5;
    let pattern3 = sin(pos.z * 10.0 + neural.layer_2 * 6.28) * 0.5 + 0.5;
    
    return (pattern1 + pattern2 + pattern3) / 3.0;
}

/// Calculate audio-reactive color shift
fn audio_color_shift(base_color: vec3<f32>) -> vec3<f32> {
    // Bass energy shifts towards red
    let bass_shift = vec3<f32>(neural.bass_energy * 0.3, 0.0, 0.0);
    
    // Treble energy shifts towards blue
    let treble_shift = vec3<f32>(0.0, 0.0, neural.treble_energy * 0.3);
    
    // Beat creates pulse
    let beat_pulse = neural.is_beat * sin(neural.time * 10.0) * 0.2;
    
    // Startle creates flash
    let startle_flash = neural.startle * 1.0;
    
    return base_color + bass_shift + treble_shift + vec3<f32>(beat_pulse, beat_pulse, beat_pulse) + vec3<f32>(startle_flash, startle_flash, startle_flash);
}

/// Calculate input-reactive geometry
fn input_geometry(pos: vec3<f32>) -> vec3<f32> {
    // Velocity creates stretching
    let velocity_stretch = pos * (1.0 + neural.velocity * 0.1);
    
    // Focus creates sharpening
    let focus_sharp = if (neural.is_focused > 0.5) {
        velocity_stretch * 1.2;
    } else {
        velocity_stretch;
    };
    
    // Chaos creates distortion
    let chaos_distort = if (neural.chaos > 0.5) {
        let noise = sin(pos.x * 20.0) * cos(pos.y * 20.0) * neural.chaos;
        focus_sharp + vec3<f32>(noise, noise, noise);
    } else {
        focus_sharp;
    };
    
    // Idle creates blur
    if (neural.is_idle > 0.5) {
        return chaos_distort * 0.8;
    }
    
    return chaos_distort;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // Calculate base color from neural state
    let hue = valence_to_hue(neural.valence);
    let saturation = arousal_to_saturation(neural.arousal);
    let brightness = entropy_to_brightness(neural.entropy);
    
    // Convert HSV to RGB
    let c = vec3<f32>(brightness * saturation);
    let x = c * (1.0 - abs(hue * 6.0 - 3.0) / 2.0);
    let m = c - x;
    let rgb = x + hue * 6.0;
    
    let rgb = if (hue < 1.0/6.0) {
        vec3<f32>(c.x, rgb.x, rgb.z);
    } else if (hue < 2.0/6.0) {
        vec3<f32>(rgb.x, rgb.y, c.x);
    } else if (hue < 3.0/6.0) {
        vec3<f32>(rgb.z, rgb.x, c.x);
    } else if (hue < 4.0/6.0) {
        vec3<f32>(rgb.y, rgb.z, c.x);
    } else if (hue < 5.0/6.0) {
        vec3<f32>(rgb.z, c.x, rgb.y);
    } else {
        vec3<f32>(rgb.x, c.x, rgb.y);
    };
    
    // Add layer pattern
    let pattern = layer_pattern(in.frag_pos.xyz);
    let pattern_color = rgb * pattern;
    
    // Apply audio reactivity
    let audio_color = audio_color_shift(pattern_color);
    
    // Apply input geometry
    let input_pos = input_geometry(in.frag_pos.xyz);
    let input_influence = length(input_pos) * 0.1;
    
    // Combine all factors
    let final_color = audio_color * (1.0 + input_influence);
    
    // Add time-based modulation
    let time_mod = sin(neural.time * 2.0) * 0.1;
    let animated_color = final_color * (1.0 + time_mod);
    
    // Apply alpha
    let alpha = 1.0;
    
    return vec4<f32>(clamp(animated_color, vec3<f32>(0.0), vec3<f32>(1.0)), alpha);
}
