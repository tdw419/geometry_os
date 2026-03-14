#![allow(dead_code, unused_variables)]
// src/memory_raycaster.rs
// Memory Raycaster - Phase 33 Step 2
// Raycasting for memory block interaction
//
// This module implements raycasting for 3D memory artifacts,
// allowing users to click on memory blocks to inspect memory regions.

use crate::memory_artifacts::MemoryArtifact;
use crate::camera::Camera;

/// Ray intersection result
#[derive(Debug, Clone, Copy)]
pub struct RayIntersection {
    /// Distance from ray origin
    pub distance: f32,
    /// Intersection point in world space
    pub point: [f32; 3],
    /// Artifact ID
    pub artifact_id: Option<usize>,
    /// UV coordinates on artifact surface
    pub uv: Option<[f32; 2]>,
}

/// Memory raycaster for 3D artifact interaction
pub struct MemoryRaycaster {
    /// Camera reference
    camera: Camera,
    /// Screen width
    screen_width: f32,
    /// Screen height
    screen_height: f32,
}

impl MemoryRaycaster {
    /// Create a new memory raycaster
    pub fn new(camera: Camera, screen_width: f32, screen_height: f32) -> Self {
        Self {
            camera,
            screen_width,
            screen_height,
        }
    }

    /// Cast a ray from screen coordinates
    ///
    /// # Arguments
    /// * `screen_x` - Screen X coordinate
    /// * `screen_y` - Screen Y coordinate
    ///
    /// # Returns
    /// Ray origin and direction in world space
    pub fn cast_ray(&self, screen_x: f32, screen_y: f32) -> ([f32; 3], [f32; 3]) {
        // Convert screen to normalized device coordinates [-1, 1]
        let ndc_x = (screen_x / self.screen_width) * 2.0 - 1.0;
        let ndc_y = (screen_y / self.screen_height) * 2.0 - 1.0;

        // Get camera position and zoom
        let cam_x = self.camera.x;
        let cam_y = self.camera.y;
        let zoom = self.camera.zoom;

        // Calculate ray direction (simplified orthographic projection)
        // For infinite 2D map, we're essentially raycasting in 2D
        let world_x = cam_x + (ndc_x * self.screen_width) / (2.0 * zoom);
        let world_y = cam_y + (ndc_y * self.screen_height) / (2.0 * zoom);

        // Ray direction (pointing into screen)
        let direction = [0.0, 0.0, -1.0]; // Into the screen

        // Ray origin (camera position)
        let origin = [world_x, world_y, 0.0];

        (origin, direction)
    }

    /// Check intersection with a memory artifact
    ///
    /// # Arguments
    /// * `ray_origin` - Ray origin
    /// * `ray_dir` - Ray direction
    /// * `artifact` - Memory artifact to test
    ///
    /// # Returns
    /// Option containing intersection result
    pub fn intersect_artifact(
        ray_origin: [f32; 3],
        ray_dir: [f32; 3],
        artifact: &MemoryArtifact,
    ) -> Option<RayIntersection> {
        // Get artifact bounding box
        let [ax, ay, az] = artifact.position;
        let [w, h, d] = artifact.dimensions;

        let min_x = ax - w / 2.0;
        let max_x = ax + w / 2.0;
        let min_y = ay - h / 2.0;
        let max_y = ay + h / 2.0;
        let min_z = az - d / 2.0;
        let max_z = az + d / 2.0;

        // Check if ray is pointing into the screen (negative Z direction)
        if ray_dir[2] >= 0.0 {
            return None; // Ray is pointing away from camera
        }

        // Calculate intersection with Z plane (front face)
        // Ray: P = O + t * D
        // Plane: Z = max_z (front face of artifact)
        // Intersection when: O_z + t * D_z = max_z
        // t = (max_z - O_z) / D_z

        let t = (max_z - ray_origin[2]) / ray_dir[2];

        // Calculate intersection point
        let ix = ray_origin[0] + t * ray_dir[0];
        let iy = ray_origin[1] + t * ray_dir[1];
        let iz = max_z;

        // Check if intersection is within X-Y bounds
        if ix >= min_x && ix <= max_x && iy >= min_y && iy <= max_y {
            // Calculate UV coordinates on the front face
            let u = (ix - min_x) / w;
            let v = (iy - min_y) / h;

            return Some(RayIntersection {
                distance: t,
                point: [ix, iy, iz],
                artifact_id: Some(artifact.id),
                uv: Some([u, v]),
            });
        }

        None
    }

    /// Find closest intersection among multiple artifacts
    ///
    /// # Arguments
    /// * `ray_origin` - Ray origin
    /// * `ray_dir` - Ray direction
    /// * `artifacts` - List of artifacts to test
    ///
    /// # Returns
    /// Option containing closest intersection
    pub fn find_closest_intersection(
        ray_origin: [f32; 3],
        ray_dir: [f32; 3],
        artifacts: &[MemoryArtifact],
    ) -> Option<RayIntersection> {
        let mut closest: Option<RayIntersection> = None;

        for artifact in artifacts {
            if let Some(intersection) = Self::intersect_artifact(ray_origin, ray_dir, artifact) {
                if let Some(ref closest_int) = closest {
                    if intersection.distance < closest_int.distance {
                        closest = Some(intersection);
                    }
                } else {
                    closest = Some(intersection);
                }
        }
    }

        closest
    }

    /// Convert screen coordinates to memory address
    ///
    /// # Arguments
    /// * `screen_x` - Screen X coordinate
    /// * `screen_y` - Screen Y coordinate
    /// * `artifact` - Memory artifact with address range
    ///
    /// # Returns
    /// Memory address if within range, None otherwise
    pub fn screen_to_address(
        &self,
        screen_x: f32,
        screen_y: f32,
        artifact: &MemoryArtifact,
    ) -> Option<usize> {
        // Cast ray and check intersection
        let (ray_origin, ray_dir) = self.cast_ray(screen_x, screen_y);

        if let Some(intersection) = Self::intersect_artifact(ray_origin, ray_dir, artifact) {
            if let Some(uv) = intersection.uv {
                // Map UV to address range
                let (start_addr, end_addr) = artifact.address_range;
                let range_size = (end_addr - start_addr) as f32;

                // Calculate address from UV
                let addr_offset = (uv[0] * uv[1]) * range_size;
                let address = start_addr + addr_offset as usize;

                return Some(address);
            }
        }

        None
    }

    /// Handle mouse click for memory inspection
    ///
    /// # Arguments
    /// * `screen_x` - Screen X coordinate
    /// * `screen_y` - Screen Y coordinate
    /// * `artifacts` - List of artifacts
    ///
    /// # Returns
    /// (artifact_id, address) if clicked on artifact, None otherwise
    pub fn handle_click(
        &self,
        screen_x: f32,
        screen_y: f32,
        artifacts: &[MemoryArtifact],
    ) -> (Option<usize>, Option<usize>) {
        let (ray_origin, ray_dir) = self.cast_ray(screen_x, screen_y);

        if let Some(intersection) = Self::find_closest_intersection(ray_origin, ray_dir, artifacts) {
            if let Some(uv) = intersection.uv {
                // Find the artifact
                if let Some(artifact) = artifacts.iter().find(|a| a.id == intersection.artifact_id.unwrap()) {
                    let (start_addr, end_addr) = artifact.address_range;
                    let range_size = (end_addr - start_addr) as f32;
                    let addr_offset = (uv[0] * uv[1]) * range_size;
                    let address = start_addr + addr_offset as usize;

                    return (intersection.artifact_id, Some(address));
                }
            }
        }

        (None, None)
    }

    /// Update screen dimensions
    pub fn update_screen_size(&mut self, width: f32, height: f32) {
        self.screen_width = width;
        self.screen_height = height;
    }

    /// Update camera
    pub fn update_camera(&mut self, camera: Camera) {
        self.camera = camera;
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_ray_casting() {
        let camera = Camera::new(0.0, 0.0, 1.0);
        let raycaster = MemoryRaycaster::new(camera, 1280.0, 720.0);

        // Cast ray from center of screen
        let (origin, dir) = raycaster.cast_ray(640.0, 360.0);

        // Verify ray direction
        assert!(dir[2] < 0.0); // Pointing into screen
        assert!(origin[0] > 0.0); // World X should be positive
    }

    #[test]
    fn test_artifact_intersection() {
        let artifact = MemoryArtifact::new(
            0,
            crate::memory_artifacts::MemoryArtifactType::Heap,
            [0.0, 0.0, 0.0],
            [100.0, 100.0, 50.0],
            (0x1000, 0x2000),
            5.5,
        );

        let raycaster = MemoryRaycaster::new(Camera::new(0.0, 0.0, 1.0), 1280.0, 720.0);
        let (origin, dir) = raycaster.cast_ray(640.0, 360.0);

        // Test intersection
        if let Some(intersection) = MemoryRaycaster::intersect_artifact(origin, dir, &artifact) {
            assert!(intersection.artifact_id == Some(0));
            assert!(intersection.distance > 0.0);
            assert!(intersection.point[2] > 0.0); // Should hit front face
            assert!(intersection.uv.is_some());
        } else {
            panic!("Expected intersection");
        }
    }

    #[test]
    fn test_screen_to_address() {
        let artifact = MemoryArtifact::new(
            0,
            crate::memory_artifacts::MemoryArtifactType::Heap,
            [0.0, 0.0, 0.0],
            [100.0, 100.0, 50.0],
            (0x1000, 0x2000),
            5.5,
        );

        let raycaster = MemoryRaycaster::new(Camera::new(0.0, 0.0, 1.0), 1280.0, 720.0);

        // Test UV (0.5, 0.5) -> center of artifact
        let address = raycaster.screen_to_address(640.0, 360.0, &artifact);

        // Should map to middle of address range
        assert_eq!(address, Some(0x1800)); // 0x1000 + (0x2000 - 0x1000) / 2
    }

    #[test]
    fn test_handle_click() {
        let artifact = MemoryArtifact::new(
            0,
            crate::memory_artifacts::MemoryArtifactType::Heap,
            [0.0, 0.0, 0.0],
            [100.0, 100.0, 50.0],
            (0x1000, 0x2000),
            5.5,
        );

        let raycaster = MemoryRaycaster::new(Camera::new(0.0, 0.0, 1.0), 1280.0, 720.0);

        // Click on center of screen
        let (artifact_id, address) = raycaster.handle_click(640.0, 360.0, &[artifact]);

        assert_eq!(artifact_id, Some(0));
        assert!(address.is_some());
    }
}
