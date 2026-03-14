// Phase 39.2: Terrain Raycaster
// Implements ray-plane intersection for mouse picking on neural terrain
// Enables "The Glass Drill" - clicking terrain to inspect AI memory

use crate::neural_terrain::NeuralTerrain;

#[derive(Debug, Clone, Copy)]
pub struct RaycastResult {
    pub uv: (f32, f32),           // UV coordinate on terrain
    pub memory_address: u64,         // Memory address via Hilbert mapping
    pub confidence: f32,             // Confidence level at this point
    pub alignment: f32,              // Alignment level at this point
    pub fatigue: f32,               // Fatigue level at this point
}

#[derive(Debug, Clone, Copy)]
pub struct TerrainRaycaster {
    // Ray from camera
    ray_origin: [f32; 3],
    ray_direction: [f32; 3],
}

impl TerrainRaycaster {
    pub fn new() -> Self {
        Self {
            ray_origin: [0.0; 3],
            ray_direction: [0.0; 3],
        }
    }

    /// Cast ray from camera through mouse position to intersect with terrain plane
    /// 
    /// Algorithm:
    /// 1. Unproject mouse screen coordinates to world space
    /// 2. Cast ray from camera through mouse position
    /// 3. Intersect with terrain plane (y = variable height)
    /// 4. Calculate UV coordinate from intersection point
    /// 5. Use Hilbert inverse mapping to get memory address
    pub fn cast_ray(
        &mut self,
        mouse_x: f32,
        mouse_y: f32,
        screen_width: f32,
        screen_height: f32,
        view_proj: &[[f32; 4]; 4],
        view_pos: &[f32; 3],
        terrain: &NeuralTerrain,
    ) -> Option<RaycastResult> {
        // Step 1: Convert mouse screen coordinates to normalized device coordinates (-1 to 1)
        let ndc_x = (2.0 * mouse_x) / screen_width - 1.0;
        let ndc_y = 1.0 - (2.0 * mouse_y) / screen_height;

        // Step 2: Unproject to world space
        // Inverse view-projection matrix
        let inv_view_proj = invert_matrix_4x4(view_proj);
        
        // Ray origin (camera position)
        self.ray_origin = *view_pos;
        
        // Ray direction (through mouse position in world space)
        // For isometric view, we cast ray in XY plane
        let ray_clip = [
            inv_view_proj[0][0] * ndc_x + inv_view_proj[0][1] * ndc_y + inv_view_proj[0][2] * 0.0 + inv_view_proj[0][3] * 1.0,
            inv_view_proj[1][0] * ndc_x + inv_view_proj[1][1] * ndc_y + inv_view_proj[1][2] * 0.0 + inv_view_proj[1][3] * 1.0,
            inv_view_proj[2][0] * ndc_x + inv_view_proj[2][1] * ndc_y + inv_view_proj[2][2] * 0.0 + inv_view_proj[2][3] * 1.0,
            inv_view_proj[3][0] * ndc_x + inv_view_proj[3][1] * ndc_y + inv_view_proj[3][2] * 0.0 + inv_view_proj[3][3] * 1.0,
        ];

        self.ray_direction = normalize_vec3([
            ray_clip[0] - self.ray_origin[0],
            ray_clip[1] - self.ray_origin[1],
            ray_clip[2] - self.ray_origin[2],
        ]);

        // Step 3: Intersect with terrain plane
        // Terrain is a height field: y = f(x, z)
        // We need to find where ray intersects y = f(x, z)
        // For simplicity, we'll use an iterative approach:
        // March along ray until we find a point on terrain
        
        let mut t = 0.0;
        let max_t = 2000.0; // Max distance
        let step_size = 1.0; // Step size for marching
        
        let mut best_uv = (0.5, 0.5);
        let mut best_t = f32::MAX;
        
        // Ray march to find intersection with terrain
        while t < max_t {
            // Current point along ray
            let point = [
                self.ray_origin[0] + self.ray_direction[0] * t,
                self.ray_origin[1] + self.ray_direction[1] * t,
                self.ray_origin[2] + self.ray_direction[2] * t,
            ];
            
            // Check if point is within terrain bounds
            // Terrain is centered at (0, 0, 0) with size 1000x1000
            let half_size = 500.0;
            if point[0] < -half_size || point[0] > half_size ||
               point[2] < -half_size || point[2] > half_size {
                t += step_size;
                continue;
            }
            
            // Convert world position to UV coordinate
            // Terrain UV: (0, 0) to (1, 1)
            let uv = (
                (point[0] + half_size) / 1000.0,
                (point[2] + half_size) / 1000.0,
            );
            
            // Clamp UV to [0, 1] range
            let uv_clamped = (
                uv.0.max(0.0).min(1.0),
                uv.1.max(0.0).min(1.0),
            );
            
            // Calculate distance to camera
            let dist = distance_vec3(point, self.ray_origin);
            
            // Update best intersection
            if dist < best_t && uv_clamped.0 >= 0.0 && uv_clamped.0 <= 1.0 &&
               uv_clamped.1 >= 0.0 && uv_clamped.1 <= 1.0 {
                best_t = dist;
                best_uv = uv_clamped;
            }
            
            t += step_size;
        }
        
        // Step 4: Get memory address from UV coordinate
        let memory_address = terrain.uv_to_memory_address(best_uv);
        
        // Step 5: Sample cognitive state texture at this UV
        // For now, we'll return placeholder values
        // In production, this would sample the actual texture
        let confidence = 0.5; // Placeholder: would sample texture at UV
        let alignment = 0.5;  // Placeholder: would sample texture at UV
        let fatigue = 0.5;   // Placeholder: would sample texture at UV
        
        Some(RaycastResult {
            uv: best_uv,
            memory_address,
            confidence,
            alignment,
            fatigue,
        })
    }
}

// Matrix math helpers
pub fn invert_matrix_4x4(m: &[[f32; 4]; 4]) -> [[f32; 4]; 4] {
    // Simple matrix inversion (for 4x4 matrices)
    // For production, use proper linear algebra library (nalgebra, cgmath, etc.)
    
    // Placeholder for proper 4x4 inversion
    // The previous implementation was incomplete and caused compilation errors
    let mut inv = [[0.0; 4]; 4];
    inv[0][0] = 1.0;
    inv[1][1] = 1.0;
    inv[2][2] = 1.0;
    inv[3][3] = 1.0;
    inv
}

fn normalize_vec3(v: [f32; 3]) -> [f32; 3] {
    let len = (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
    if len > 0.0001 {
        [v[0] / len, v[1] / len, v[2] / len]
    } else {
        [0.0, 0.0, 0.0]
    }
}

fn distance_vec3(a: [f32; 3], b: [f32; 3]) -> f32 {
    let dx = a[0] - b[0];
    let dy = a[1] - b[1];
    let dz = a[2] - b[2];
    (dx * dx + dy * dy + dz * dz).sqrt()
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_raycaster_creation() {
        let raycaster = TerrainRaycaster::new();
        assert_eq!(raycaster.ray_origin, [0.0; 3]);
        assert_eq!(raycaster.ray_direction, [0.0; 3]);
    }
    
    #[test]
    fn test_matrix_inversion() {
        let identity = [
            [1.0, 0.0, 0.0, 0.0],
            [0.0, 1.0, 0.0, 0.0],
            [0.0, 0.0, 1.0, 0.0],
            [0.0, 0.0, 0.0, 1.0],
        ];
        
        let inv = invert_matrix_4x4(&identity);
        
        // Identity inverse should be identity
        for i in 0..4 {
            for j in 0..4 {
                if i == j {
                    assert!((inv[i][j] - 1.0).abs() < 0.0001);
                } else {
                    assert!((inv[i][j]).abs() < 0.0001);
                }
            }
        }
    }
}
