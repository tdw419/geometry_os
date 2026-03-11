// src/memory_artifacts.rs
// Memory Artifacts - Phase 33 Step 2
// Generates 3D geometry for memory region visualization
//
// This module creates 3D artifacts representing memory regions:
// - Heaps as translucent blocks
// - Code segments as pillars
// - Data regions as platforms
// - Stack as vertical structures

use wgpu::{self, Device, Queue, Buffer, VertexBufferLayout};
use bytemuck::{Pod, Zeroable};
use std::sync::Arc;

/// Memory artifact type
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum MemoryArtifactType {
    /// Heap memory (translucent block)
    Heap,
    /// Stack memory (vertical tower)
    Stack,
    /// Code segment (crystalline pillar)
    Code,
    /// Data segment (platform)
    Data,
}

/// Memory artifact vertex
#[repr(C)]
#[derive(Debug, Clone, Copy, Pod, Zeroable)]
pub struct MemoryVertex {
    /// Position (x, y, z)
    pub position: [f32; 3],
    /// Color (r, g, b, a)
    pub color: [f32; 4],
    /// UV coordinates (u, v)
    pub uv: [f32; 2],
    /// Hot-swap morph factor (0.0 to 1.0)
    pub morph_factor: f32,
}

impl MemoryVertex {
    /// Create a new vertex
    pub fn new(position: [f32; 3], color: [f32; 4], uv: [f32; 2], morph_factor: f32) -> Self {
        Self {
            position,
            color,
            uv,
            morph_factor,
        }
    }
}

/// Memory artifact representing a 3D memory region
pub struct MemoryArtifact {
    /// Artifact ID
    pub id: usize,
    /// Artifact type
    pub artifact_type: MemoryArtifactType,
    /// Vertices
    pub vertices: Vec<MemoryVertex>,
    /// Indices
    pub indices: Vec<u16>,
    /// Position in world space
    pub position: [f32; 3],
    /// Dimensions
    pub dimensions: [f32; 3], // width, height, depth
    /// Memory address range
    pub address_range: (usize, usize),
    /// Entropy value (for visualization)
    pub entropy: f32,
    /// Hot-swap morph factor (0.0 to 1.0)
    pub morph_factor: f32,
}

impl MemoryArtifact {
    /// Create a new memory artifact
    pub fn new(
        id: usize,
        artifact_type: MemoryArtifactType,
        position: [f32; 3],
        dimensions: [f32; 3],
        address_range: (usize, usize),
        entropy: f32,
    ) -> Self {
        let vertices = Self::generate_vertices(artifact_type, dimensions, entropy, 0.0);
        let indices = Self::generate_indices();

        Self {
            id,
            artifact_type,
            vertices,
            indices,
            position,
            dimensions,
            address_range,
            entropy,
            morph_factor: 0.0,
        }
    }

    /// Set morph factor and regenerate vertices
    pub fn set_morph_factor(&mut self, factor: f32) {
        self.morph_factor = factor;
        self.vertices = Self::generate_vertices(
            self.artifact_type,
            self.dimensions,
            self.entropy,
            factor
        );
    }

    /// Generate vertices for artifact type
    fn generate_vertices(artifact_type: MemoryArtifactType, dimensions: [f32; 3], entropy: f32, morph_factor: f32) -> Vec<MemoryVertex> {
        let [width, height, depth] = dimensions;

        match artifact_type {
            MemoryArtifactType::Heap => {
                // Translucent block with gradient
                Self::generate_block_vertices(width, height, depth, [0.2, 0.8, 0.2, 0.6], entropy, morph_factor)
            }
            MemoryArtifactType::Stack => {
                // Vertical tower
                Self::generate_tower_vertices(width, height, depth, [0.8, 0.2, 0.8, 0.7], entropy, morph_factor)
            }
            MemoryArtifactType::Code => {
                // Crystalline pillar
                Self::generate_pillar_vertices(width, height, depth, [0.2, 0.8, 1.0, 0.8], entropy, morph_factor)
            }
            MemoryArtifactType::Data => {
                // Platform
                Self::generate_platform_vertices(width, height, depth, [0.8, 0.8, 0.2, 0.7], entropy, morph_factor)
            }
        }
    }

    /// Generate block vertices (heap)
    fn generate_block_vertices(width: f32, height: f32, depth: f32, base_color: [f32; 4], entropy: f32, morph_factor: f32) -> Vec<MemoryVertex> {
        let hw = width / 2.0;
        let hh = height / 2.0;
        let hd = depth / 2.0;

        // Adjust alpha based on entropy
        let alpha = base_color[3] * (0.3 + entropy * 0.1).min(0.9);

        let mut vertices = Vec::new();

        // Front face
        vertices.push(MemoryVertex::new([-hw, -hh, hd],  [base_color[0], base_color[1], base_color[2], alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh, hd],  [base_color[0], base_color[1], base_color[2], alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh, hd],  [base_color[0], base_color[1], base_color[2], alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh, hd],  [base_color[0], base_color[1], base_color[2], alpha], [0.0, 1.0], morph_factor));

        // Back face
        vertices.push(MemoryVertex::new([ hw, -hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw, -hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [0.0, 1.0], morph_factor));

        // Top face
        vertices.push(MemoryVertex::new([-hw,  hh, -hd], [base_color[0] * 1.2, base_color[1] * 1.2, base_color[2] * 1.2, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh, -hd], [base_color[0] * 1.2, base_color[1] * 1.2, base_color[2] * 1.2, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh,  hd], [base_color[0] * 1.2, base_color[1] * 1.2, base_color[2] * 1.2, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh,  hd], [base_color[0] * 1.2, base_color[1] * 1.2, base_color[2] * 1.2, alpha], [0.0, 1.0], morph_factor));

        // Bottom face
        vertices.push(MemoryVertex::new([-hw, -hh, -hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh, -hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh,  hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw, -hh,  hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [0.0, 1.0], morph_factor));

        // Left face
        vertices.push(MemoryVertex::new([-hw, -hh, -hd], [base_color[0] * 0.8, base_color[1] * 0.8, base_color[2] * 0.8, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw, -hh,  hd], [base_color[0] * 0.8, base_color[1] * 0.8, base_color[2] * 0.8, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh,  hd], [base_color[0] * 0.8, base_color[1] * 0.8, base_color[2] * 0.8, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh, -hd], [base_color[0] * 0.8, base_color[1] * 0.8, base_color[2] * 0.8, alpha], [0.0, 1.0], morph_factor));

        // Right face
        vertices.push(MemoryVertex::new([ hw, -hh,  hd], [base_color[0] * 0.8, base_color[1] * 0.8, base_color[2] * 0.8, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh, -hd], [base_color[0] * 0.8, base_color[1] * 0.8, base_color[2] * 0.8, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh, -hd], [base_color[0] * 0.8, base_color[1] * 0.8, base_color[2] * 0.8, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh,  hd], [base_color[0] * 0.8, base_color[1] * 0.8, base_color[2] * 0.8, alpha], [0.0, 1.0], morph_factor));

        vertices
    }

    /// Generate tower vertices (stack)
    fn generate_tower_vertices(width: f32, height: f32, depth: f32, base_color: [f32; 4], entropy: f32, morph_factor: f32) -> Vec<MemoryVertex> {
        let hw = width / 2.0;
        let hh = height / 2.0;
        let hd = depth / 2.0;

        let alpha = base_color[3] * (0.5 + entropy * 0.1).min(0.95);

        let mut vertices = Vec::new();

        // Stack is a tall, narrow structure
        // Front face
        vertices.push(MemoryVertex::new([-hw, -hh, hd],  [base_color[0], base_color[1], base_color[2], alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh, hd],  [base_color[0], base_color[1], base_color[2], alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh, hd],  [base_color[0], base_color[1], base_color[2], alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh, hd],  [base_color[0], base_color[1], base_color[2], alpha], [0.0, 1.0], morph_factor));

        // Back face
        vertices.push(MemoryVertex::new([ hw, -hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw, -hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [0.0, 1.0], morph_factor));

        // Top face (with glow effect)
        vertices.push(MemoryVertex::new([-hw,  hh, -hd], [base_color[0] * 1.5, base_color[1] * 1.5, base_color[2] * 1.5, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh, -hd], [base_color[0] * 1.5, base_color[1] * 1.5, base_color[2] * 1.5, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh,  hd], [base_color[0] * 1.5, base_color[1] * 1.5, base_color[2] * 1.5, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh,  hd], [base_color[0] * 1.5, base_color[1] * 1.5, base_color[2] * 1.5, alpha], [0.0, 1.0], morph_factor));

        // Bottom face
        vertices.push(MemoryVertex::new([-hw, -hh, -hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh, -hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh,  hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw, -hh,  hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [0.0, 1.0], morph_factor));

        // Left face
        vertices.push(MemoryVertex::new([-hw, -hh, -hd], [base_color[0] * 0.9, base_color[1] * 0.9, base_color[2] * 0.9, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw, -hh,  hd], [base_color[0] * 0.9, base_color[1] * 0.9, base_color[2] * 0.9, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh,  hd], [base_color[0] * 0.9, base_color[1] * 0.9, base_color[2] * 0.9, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh, -hd], [base_color[0] * 0.9, base_color[1] * 0.9, base_color[2] * 0.9, alpha], [0.0, 1.0], morph_factor));

        // Right face
        vertices.push(MemoryVertex::new([ hw, -hh,  hd], [base_color[0] * 0.9, base_color[1] * 0.9, base_color[2] * 0.9, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh, -hd], [base_color[0] * 0.9, base_color[1] * 0.9, base_color[2] * 0.9, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh, -hd], [base_color[0] * 0.9, base_color[1] * 0.9, base_color[2] * 0.9, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh,  hd], [base_color[0] * 0.9, base_color[1] * 0.9, base_color[2] * 0.9, alpha], [0.0, 1.0], morph_factor));

        vertices
    }

    /// Generate pillar vertices (code)
    fn generate_pillar_vertices(width: f32, height: f32, depth: f32, base_color: [f32; 4], entropy: f32, morph_factor: f32) -> Vec<MemoryVertex> {
        let hw = width / 2.0;
        let hh = height / 2.0;
        let hd = depth / 2.0;

        let alpha = base_color[3] * (0.6 + entropy * 0.15).min(0.95);

        let mut vertices = Vec::new();

        // Code is a crystalline pillar
        // Front face
        vertices.push(MemoryVertex::new([-hw, -hh, hd],  [base_color[0], base_color[1], base_color[2], alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh, hd],  [base_color[0], base_color[1], base_color[2], alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh, hd],  [base_color[0], base_color[1], base_color[2], alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh, hd],  [base_color[0], base_color[1], base_color[2], alpha], [0.0, 1.0], morph_factor));

        // Back face
        vertices.push(MemoryVertex::new([ hw, -hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw, -hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [0.0, 1.0], morph_factor));

        // Top face (crystalline)
        vertices.push(MemoryVertex::new([-hw,  hh, -hd], [base_color[0] * 2.0, base_color[1] * 2.0, base_color[2] * 2.0, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh, -hd], [base_color[0] * 2.0, base_color[1] * 2.0, base_color[2] * 2.0, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh,  hd], [base_color[0] * 2.0, base_color[1] * 2.0, base_color[2] * 2.0, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh,  hd], [base_color[0] * 2.0, base_color[1] * 2.0, base_color[2] * 2.0, alpha], [0.0, 1.0], morph_factor));

        // Bottom face
        vertices.push(MemoryVertex::new([-hw, -hh, -hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh, -hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh,  hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw, -hh,  hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [0.0, 1.0], morph_factor));

        // Left face
        vertices.push(MemoryVertex::new([-hw, -hh, -hd], [base_color[0] * 0.85, base_color[1] * 0.85, base_color[2] * 0.85, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw, -hh,  hd], [base_color[0] * 0.85, base_color[1] * 0.85, base_color[2] * 0.85, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh,  hd], [base_color[0] * 0.85, base_color[1] * 0.85, base_color[2] * 0.85, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh, -hd], [base_color[0] * 0.85, base_color[1] * 0.85, base_color[2] * 0.85, alpha], [0.0, 1.0], morph_factor));

        // Right face
        vertices.push(MemoryVertex::new([ hw, -hh,  hd], [base_color[0] * 0.85, base_color[1] * 0.85, base_color[2] * 0.85, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh, -hd], [base_color[0] * 0.85, base_color[1] * 0.85, base_color[2] * 0.85, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh, -hd], [base_color[0] * 0.85, base_color[1] * 0.85, base_color[2] * 0.85, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh,  hd], [base_color[0] * 0.85, base_color[1] * 0.85, base_color[2] * 0.85, alpha], [0.0, 1.0], morph_factor));

        vertices
    }

    /// Generate platform vertices (data)
    fn generate_platform_vertices(width: f32, height: f32, depth: f32, base_color: [f32; 4], entropy: f32, morph_factor: f32) -> Vec<MemoryVertex> {
        let hw = width / 2.0;
        let hh = height / 2.0;
        let hd = depth / 2.0;

        let alpha = base_color[3] * (0.4 + entropy * 0.1).min(0.9);

        let mut vertices = Vec::new();

        // Data is a platform
        // Top face
        vertices.push(MemoryVertex::new([-hw, hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, hh,  hd], [base_color[0], base_color[1], base_color[2], alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw, hh,  hd], [base_color[0], base_color[1], base_color[2], alpha], [0.0, 1.0], morph_factor));

        // Bottom face
        vertices.push(MemoryVertex::new([-hw, -hh, -hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh, -hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh,  hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw, -hh,  hd], [base_color[0] * 0.5, base_color[1] * 0.5, base_color[2] * 0.5, alpha], [0.0, 1.0], morph_factor));

        // Left face
        vertices.push(MemoryVertex::new([-hw, -hh, -hd], [base_color[0] * 0.7, base_color[1] * 0.7, base_color[2] * 0.7, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw, -hh,  hd], [base_color[0] * 0.7, base_color[1] * 0.7, base_color[2] * 0.7, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh,  hd], [base_color[0] * 0.7, base_color[1] * 0.7, base_color[2] * 0.7, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh, -hd], [base_color[0] * 0.7, base_color[1] * 0.7, base_color[2] * 0.7, alpha], [0.0, 1.0], morph_factor));

        // Right face
        vertices.push(MemoryVertex::new([ hw, -hh,  hd], [base_color[0] * 0.7, base_color[1] * 0.7, base_color[2] * 0.7, alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh, -hd], [base_color[0] * 0.7, base_color[1] * 0.7, base_color[2] * 0.7, alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh,  hd], [base_color[0] * 0.7, base_color[1] * 0.7, base_color[2] * 0.7, alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh,  hd], [base_color[0] * 0.7, base_color[1] * 0.7, base_color[2] * 0.7, alpha], [0.0, 1.0], morph_factor));

        // Front face
        vertices.push(MemoryVertex::new([-hw, -hh, hd], [base_color[0], base_color[1], base_color[2], alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw, -hh, hd], [base_color[0], base_color[1], base_color[2], alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh, hd], [base_color[0], base_color[1], base_color[2], alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh, hd], [base_color[0], base_color[1], base_color[2], alpha], [0.0, 1.0], morph_factor));

        // Back face
        vertices.push(MemoryVertex::new([ hw, -hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [0.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw, -hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [1.0, 0.0], morph_factor));
        vertices.push(MemoryVertex::new([-hw,  hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [1.0, 1.0], morph_factor));
        vertices.push(MemoryVertex::new([ hw,  hh, -hd], [base_color[0], base_color[1], base_color[2], alpha], [0.0, 1.0], morph_factor));

        vertices
    }

    /// Generate indices for cube faces
    fn generate_indices() -> Vec<u16> {
        // Each face has 2 triangles (6 vertices per face)
        // 6 faces = 36 vertices, 36 indices (using triangle list)
        let mut indices = Vec::new();

        // Front face
        indices.extend_from_slice(&[0, 1, 2, 0, 2, 3]);
        // Back face
        indices.extend_from_slice(&[4, 5, 6, 4, 6, 7]);
        // Top face
        indices.extend_from_slice(&[8, 9, 10, 8, 10, 11]);
        // Bottom face
        indices.extend_from_slice(&[12, 13, 14, 12, 14, 15]);
        // Left face
        indices.extend_from_slice(&[16, 17, 18, 16, 18, 19]);
        // Right face
        indices.extend_from_slice(&[20, 21, 22, 20, 22, 23]);

        indices
    }

    /// Get vertex buffer layout
    pub fn vertex_buffer_layout() -> VertexBufferLayout<'static> {
        wgpu::VertexBufferLayout {
            array_stride: std::mem::size_of::<MemoryVertex>() as wgpu::BufferAddress,
            step_mode: wgpu::VertexStepMode::Vertex,
            attributes: &[
                wgpu::VertexAttribute {
                    offset: 0,
                    shader_location: 0,
                    format: wgpu::VertexFormat::Float32x3,
                },
                wgpu::VertexAttribute {
                    offset: std::mem::size_of::<[f32; 3]>() as wgpu::BufferAddress,
                    shader_location: 1,
                    format: wgpu::VertexFormat::Float32x4,
                },
                wgpu::VertexAttribute {
                    offset: std::mem::size_of::<[f32; 7]>() as wgpu::BufferAddress,
                    shader_location: 2,
                    format: wgpu::VertexFormat::Float32x2,
                },
                wgpu::VertexAttribute {
                    offset: std::mem::size_of::<[f32; 9]>() as wgpu::BufferAddress,
                    shader_location: 3,
                    format: wgpu::VertexFormat::Float32,
                },
            ],
        }
    }
}

/// Manager for 3D memory artifacts
pub struct MemoryArtifactManager {
    /// GPU device
    device: Arc<Device>,
    /// GPU queue
    queue: Arc<Queue>,
    /// Artifacts
    artifacts: Vec<MemoryArtifact>,
    /// Vertex buffer
    vertex_buffer: Option<Buffer>,
    /// Index buffer
    index_buffer: Option<Buffer>,
}

impl MemoryArtifactManager {
    /// Create a new memory artifact manager
    pub fn new(device: Arc<Device>, queue: Arc<Queue>) -> Self {
        Self {
            device,
            queue,
            artifacts: Vec::new(),
            vertex_buffer: None,
            index_buffer: None,
        }
    }

    /// Add a memory artifact
    pub fn add_artifact(&mut self, artifact: MemoryArtifact) {
        self.artifacts.push(artifact);
    }

    /// Create artifacts from V2 brick
    pub fn create_from_brick(&mut self, brick: &crate::memory_tensor::V2Brick, position: [f32; 3]) -> usize {
        let id = self.artifacts.len();
        let dimensions = [
            brick.header.texture_width as f32,
            brick.header.texture_height as f32,
            (brick.header.texture_width as f32) * 0.5, // Depth based on width
        ];

        let artifact = MemoryArtifact::new(
            id,
            MemoryArtifactType::Heap,
            position,
            dimensions,
            (0, brick.header.original_size as usize),
            brick.header.entropy,
        );

        self.artifacts.push(artifact);
        id
    }

    /// Update GPU buffers
    pub fn update_buffers(&mut self) {
        if self.artifacts.is_empty() {
            return;
        }

        // Collect all vertices and indices
        let mut all_vertices = Vec::new();
        let mut all_indices = Vec::new();
        let mut index_offset = 0u16;

        for artifact in &self.artifacts {
            for vertex in &artifact.vertices {
                // Apply position offset
                let mut pos = vertex.position;
                pos[0] += artifact.position[0];
                pos[1] += artifact.position[1];
                pos[2] += artifact.position[2];
                all_vertices.push(MemoryVertex::new(pos, vertex.color, vertex.uv, vertex.morph_factor));
            }

            for index in &artifact.indices {
                all_indices.push(index + index_offset);
            }

            index_offset += artifact.vertices.len() as u16;
        }

        // Create vertex buffer
        let vertex_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Memory Artifact Vertex Buffer"),
            size: (all_vertices.len() * std::mem::size_of::<MemoryVertex>()) as u64,
            usage: wgpu::BufferUsages::VERTEX | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        self.queue.write_buffer(
            &vertex_buffer,
            0,
            bytemuck::cast_slice(&all_vertices),
        );

        // Create index buffer
        let index_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Memory Artifact Index Buffer"),
            size: (all_indices.len() * std::mem::size_of::<u16>()) as u64,
            usage: wgpu::BufferUsages::INDEX | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        self.queue.write_buffer(
            &index_buffer,
            0,
            bytemuck::cast_slice(&all_indices),
        );

        self.vertex_buffer = Some(vertex_buffer);
        self.index_buffer = Some(index_buffer);
    }

    /// Get vertex buffer
    pub fn get_vertex_buffer(&self) -> Option<&Buffer> {
        self.vertex_buffer.as_ref()
    }

    /// Get index buffer
    pub fn get_index_buffer(&self) -> Option<&Buffer> {
        self.index_buffer.as_ref()
    }

    /// Get index count
    pub fn get_index_count(&self) -> u32 {
        if let Some(ref buffer) = self.index_buffer {
            // Buffer size / size of u16
            (buffer.size() / std::mem::size_of::<u16>() as u64) as u32
        } else {
            0
        }
    }

    /// Set color of an artifact by ID
    pub fn set_color(&mut self, id: usize, color: [f32; 4]) {
        if let Some(artifact) = self.artifacts.get_mut(id) {
            for vertex in &mut artifact.vertices {
                vertex.color = color;
            }
        }
    }

    /// Pulse an artifact by ID (scale effect)
    pub fn pulse(&mut self, id: usize, intensity: f32, duration_ms: u64) {
        if let Some(artifact) = self.artifacts.get_mut(id) {
            // Apply pulse effect by making it brighter
            for vertex in &mut artifact.vertices {
                vertex.color[0] = (vertex.color[0] + intensity).min(1.0);
                vertex.color[1] = (vertex.color[1] + intensity).min(1.0);
                vertex.color[2] = (vertex.color[2] + intensity).min(1.0);
            }
        }
    }

    /// Get artifacts
    pub fn get_artifacts(&self) -> &[MemoryArtifact] {
        &self.artifacts
    }

    /// Clear all artifacts
    pub fn clear(&mut self) {
        self.artifacts.clear();
        self.vertex_buffer = None;
        self.index_buffer = None;
    }
    /// Set morph factor for a specific artifact
    pub fn set_morph_factor(&mut self, id: usize, factor: f32) {
        if let Some(artifact) = self.artifacts.iter_mut().find(|a| a.id == id) {
            artifact.set_morph_factor(factor);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_memory_vertex() {
        let vertex = MemoryVertex::new([1.0, 2.0, 3.0], [0.5, 0.5, 0.5, 1.0], [0.0, 1.0], 0.0);
        assert_eq!(vertex.position, [1.0, 2.0, 3.0]);
        assert_eq!(vertex.color, [0.5, 0.5, 0.5, 1.0]);
        assert_eq!(vertex.uv, [0.0, 1.0]);
    }

    #[test]
    fn test_memory_artifact_creation() {
        let artifact = MemoryArtifact::new(
            0,
            MemoryArtifactType::Heap,
            [100.0, 200.0, 300.0],
            [50.0, 60.0, 70.0],
            (0x1000, 0x2000),
            5.5,
        );

        assert_eq!(artifact.id, 0);
        assert_eq!(artifact.artifact_type, MemoryArtifactType::Heap);
        assert_eq!(artifact.position, [100.0, 200.0, 300.0]);
        assert_eq!(artifact.address_range, (0x1000, 0x2000));
        assert_eq!(artifact.entropy, 5.5);
    }

    #[test]
    fn test_artifact_manager() {
        // This test would require a GPU device and queue
        // For now, just verify creation
        // let device = ...;
        // let queue = ...;
        // let manager = MemoryArtifactManager::new(device, queue);
    }
}
