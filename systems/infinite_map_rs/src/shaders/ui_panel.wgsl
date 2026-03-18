// UI Panel Shader
// Renders semi-transparent rectangular panels for the inspector UI

struct UIVertex {
    @location(0) position: vec3<f32>,
    @location(1) color: vec4<f32>,
}

struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) color: vec4<f32>,
}

@vertex
fn vs_main(vertex: UIVertex) -> VertexOutput {
    var output: VertexOutput;
    // Convert screen-space coordinates to clip space
    // Input: screen pixels (0 to width, 0 to height)
    // Output: clip space (-1 to 1)
    // Note: For now, we'll assume position is already in normalized coordinates
    // TODO: Add proper orthographic projection matrix
    output.clip_position = vec4<f32>(vertex.position, 1.0);
    output.color = vertex.color;
    return output;
}

@fragment
fn fs_main(input: VertexOutput) -> @location(0) vec4<f32> {
    // Return the vertex color with alpha blending
    return input.color;
}
