//! Momentum Camera System - Physics-based camera with inertia
//!
//! This module implements an embodied camera system that responds to user input
//! with realistic physics, creating a sense of presence and weight as users
//! navigate through the neural landscape.

use glam::{Mat4, Vec2, Vec3};
use std::time::Instant;

/// Configuration for momentum camera behavior
#[derive(Debug, Clone)]
pub struct MomentumCameraConfig {
    /// Linear acceleration (units/sec²)
    pub acceleration: f32,
    /// Maximum velocity (units/sec)
    pub max_velocity: f32,
    /// Velocity damping factor (0-1, higher = more friction)
    pub damping: f32,
    /// Rotation acceleration (radians/sec²)
    pub rotation_acceleration: f32,
    /// Maximum angular velocity (radians/sec)
    pub max_angular_velocity: f32,
    /// Rotation damping
    pub rotation_damping: f32,
    /// Zoom acceleration
    pub zoom_acceleration: f32,
    /// Maximum zoom velocity
    pub max_zoom_velocity: f32,
    /// Zoom damping
    pub zoom_damping: f32,
    /// Minimum distance from target
    pub min_distance: f32,
    /// Maximum distance from target
    pub max_distance: f32,
    /// Smoothing factor for target following (0-1)
    pub target_smoothing: f32,
}

impl Default for MomentumCameraConfig {
    fn default() -> Self {
        Self {
            acceleration: 50.0,
            max_velocity: 20.0,
            damping: 0.92,
            rotation_acceleration: 3.0,
            max_angular_velocity: 2.0,
            rotation_damping: 0.88,
            zoom_acceleration: 10.0,
            max_zoom_velocity: 5.0,
            zoom_damping: 0.90,
            min_distance: 2.0,
            max_distance: 100.0,
            target_smoothing: 0.1,
        }
    }
}

/// Physics state for the camera
#[derive(Debug, Clone)]
pub struct CameraPhysics {
    /// Current velocity (units/sec)
    pub velocity: Vec3,
    /// Current angular velocity (yaw, pitch) in radians/sec
    pub angular_velocity: Vec2,
    /// Current zoom velocity
    pub zoom_velocity: f32,
    /// Last update time
    pub last_update: Instant,
}

impl Default for CameraPhysics {
    fn default() -> Self {
        Self {
            velocity: Vec3::ZERO,
            angular_velocity: Vec2::ZERO,
            zoom_velocity: 0.0,
            last_update: Instant::now(),
        }
    }
}

/// Input state for camera control
#[derive(Debug, Clone, Default)]
pub struct CameraInput {
    /// Movement input (-1 to 1 for each axis)
    pub movement: Vec3,
    /// Rotation input (-1 to 1 for yaw and pitch)
    pub rotation: Vec2,
    /// Zoom input (-1 to 1)
    pub zoom: f32,
    /// Whether any input is active
    pub is_active: bool,
}

/// Momentum Camera with physics-based movement
#[derive(Debug, Clone)]
pub struct MomentumCamera {
    /// Camera position in world space
    pub position: Vec3,
    /// Point the camera is looking at
    pub target: Vec3,
    /// Up vector
    pub up: Vec3,
    /// Distance from target
    pub distance: f32,
    /// Yaw angle (rotation around up axis)
    pub yaw: f32,
    /// Pitch angle (rotation around right axis)
    pub pitch: f32,
    /// Field of view in radians
    pub fov: f32,
    /// Aspect ratio
    pub aspect_ratio: f32,
    /// Near plane distance
    pub near: f32,
    /// Far plane distance
    pub far: f32,
    /// Configuration
    pub config: MomentumCameraConfig,
    /// Physics state
    pub physics: CameraPhysics,
    /// Trail positions for visual effect
    pub trail: Vec<Vec3>,
    /// Maximum trail length
    pub max_trail_length: usize,
}

impl Default for MomentumCamera {
    fn default() -> Self {
        Self {
            position: Vec3::new(0.0, 5.0, 15.0),
            target: Vec3::ZERO,
            up: Vec3::Y,
            distance: 15.0,
            yaw: 0.0,
            pitch: 0.3,
            fov: 45.0_f32.to_radians(),
            aspect_ratio: 16.0 / 9.0,
            near: 0.1,
            far: 1000.0,
            config: MomentumCameraConfig::default(),
            physics: CameraPhysics::default(),
            trail: Vec::new(),
            max_trail_length: 20,
        }
    }
}

impl MomentumCamera {
    /// Create a new momentum camera with custom config
    pub fn new(config: MomentumCameraConfig) -> Self {
        Self {
            config,
            ..Default::default()
        }
    }

    /// Get the view matrix
    pub fn view_matrix(&self) -> Mat4 {
        Mat4::look_at_rh(self.position, self.target, self.up)
    }

    /// Get the projection matrix
    pub fn projection_matrix(&self) -> Mat4 {
        Mat4::perspective_rh(self.fov, self.aspect_ratio, self.near, self.far)
    }

    /// Get combined view-projection matrix
    pub fn view_proj_matrix(&self) -> Mat4 {
        self.projection_matrix() * self.view_matrix()
    }

    /// Get the camera's forward direction
    pub fn forward(&self) -> Vec3 {
        (self.target - self.position).normalize()
    }

    /// Get the camera's right direction
    pub fn right(&self) -> Vec3 {
        self.forward().cross(self.up).normalize()
    }

    /// Apply input and update physics
    pub fn apply_input(&mut self, input: &CameraInput) {
        let now = Instant::now();
        let dt = now
            .duration_since(self.physics.last_update)
            .as_secs_f32()
            .min(0.1);
        self.physics.last_update = now;

        // Apply acceleration from input
        if input.is_active {
            // Movement acceleration
            let forward = self.forward();
            let right = self.right();

            let movement_accel = forward * input.movement.z * self.config.acceleration
                + right * input.movement.x * self.config.acceleration
                + self.up * input.movement.y * self.config.acceleration;

            self.physics.velocity += movement_accel * dt;

            // Rotation acceleration
            let rotation_accel = Vec2::new(
                input.rotation.x * self.config.rotation_acceleration,
                input.rotation.y * self.config.rotation_acceleration,
            );
            self.physics.angular_velocity += rotation_accel * dt;

            // Zoom acceleration
            self.physics.zoom_velocity += input.zoom * self.config.zoom_acceleration * dt;
        }

        // Apply velocity limits
        let vel_mag = self.physics.velocity.length();
        if vel_mag > self.config.max_velocity {
            self.physics.velocity = self.physics.velocity.normalize() * self.config.max_velocity;
        }

        let ang_mag = self.physics.angular_velocity.length();
        if ang_mag > self.config.max_angular_velocity {
            self.physics.angular_velocity =
                self.physics.angular_velocity.normalize() * self.config.max_angular_velocity;
        }

        self.physics.zoom_velocity = self.physics.zoom_velocity.clamp(
            -self.config.max_zoom_velocity,
            self.config.max_zoom_velocity,
        );

        // Apply damping
        self.physics.velocity *= self.config.damping;
        self.physics.angular_velocity *= self.config.rotation_damping;
        self.physics.zoom_velocity *= self.config.zoom_damping;

        // Stop very small velocities to prevent drift
        if self.physics.velocity.length() < 0.01 {
            self.physics.velocity = Vec3::ZERO;
        }
        if self.physics.angular_velocity.length() < 0.001 {
            self.physics.angular_velocity = Vec2::ZERO;
        }
        if self.physics.zoom_velocity.abs() < 0.01 {
            self.physics.zoom_velocity = 0.0;
        }

        // Apply velocities
        self.apply_velocities(dt);
    }

    /// Apply velocities to camera state
    fn apply_velocities(&mut self, dt: f32) {
        // Store trail position before moving
        if self.trail.len() >= self.max_trail_length {
            self.trail.remove(0);
        }
        self.trail.push(self.position);

        // Apply linear velocity
        self.position += self.physics.velocity * dt;
        self.target += self.physics.velocity * dt;

        // Apply angular velocity (orbit around target)
        self.yaw += self.physics.angular_velocity.x * dt;
        self.pitch += self.physics.angular_velocity.y * dt;

        // Clamp pitch to prevent flipping
        self.pitch = self.pitch.clamp(-1.5, 1.5);

        // Apply zoom velocity
        self.distance += self.physics.zoom_velocity * dt;
        self.distance = self
            .distance
            .clamp(self.config.min_distance, self.config.max_distance);

        // Update position based on yaw, pitch, and distance
        self.update_orbital_position();
    }

    /// Update camera position based on orbital parameters
    fn update_orbital_position(&mut self) {
        let x = self.distance * self.yaw.cos() * self.pitch.cos();
        let y = self.distance * self.pitch.sin();
        let z = self.distance * self.yaw.sin() * self.pitch.cos();

        self.position = self.target + Vec3::new(x, y, z);
    }

    /// Smoothly move camera to look at a new target
    pub fn look_at(&mut self, new_target: Vec3, smooth: bool) {
        if smooth {
            // Store the offset to maintain relative position
            let offset = self.position - self.target;
            self.target = self.target.lerp(new_target, self.config.target_smoothing);
            self.position = self.target + offset;
        } else {
            let offset = self.position - self.target;
            self.target = new_target;
            self.position = new_target + offset;
        }
    }

    /// Instantly move to a position
    pub fn teleport_to(&mut self, position: Vec3, target: Vec3) {
        self.position = position;
        self.target = target;
        self.distance = (position - target).length();
        self.physics.velocity = Vec3::ZERO;
        self.physics.angular_velocity = Vec2::ZERO;
        self.physics.zoom_velocity = 0.0;
        self.trail.clear();
    }

    /// Add impulse velocity (for recoil effects, etc.)
    pub fn add_impulse(&mut self, impulse: Vec3) {
        self.physics.velocity += impulse;
    }

    /// Add angular impulse
    pub fn add_angular_impulse(&mut self, impulse: Vec2) {
        self.physics.angular_velocity += impulse;
    }

    /// Get trail positions for rendering
    pub fn get_trail(&self) -> &[Vec3] {
        &self.trail
    }

    /// Clear the trail
    pub fn clear_trail(&mut self) {
        self.trail.clear();
    }

    /// Update aspect ratio (call on window resize)
    pub fn set_aspect_ratio(&mut self, aspect_ratio: f32) {
        self.aspect_ratio = aspect_ratio;
    }

    /// Get camera speed (for UI feedback)
    pub fn get_speed(&self) -> f32 {
        self.physics.velocity.length()
    }

    /// Check if camera is moving
    pub fn is_moving(&self) -> bool {
        self.physics.velocity.length() > 0.1
            || self.physics.angular_velocity.length() > 0.01
            || self.physics.zoom_velocity.abs() > 0.1
    }
}

/// Easing functions for smooth transitions
pub mod easing {
    /// Quadratic ease in-out
    pub fn quad_in_out(t: f32) -> f32 {
        if t < 0.5 {
            2.0 * t * t
        } else {
            1.0 - (-2.0 * t + 2.0).powi(2) / 2.0
        }
    }

    /// Cubic ease in-out
    pub fn cubic_in_out(t: f32) -> f32 {
        if t < 0.5 {
            4.0 * t * t * t
        } else {
            1.0 - (-2.0 * t + 2.0).powi(3) / 2.0
        }
    }

    /// Elastic ease out (for bouncy effects)
    pub fn elastic_out(t: f32) -> f32 {
        const C4: f32 = std::f32::consts::TAU / 3.0;
        if t == 0.0 {
            0.0
        } else if t == 1.0 {
            1.0
        } else {
            2.0_f32.powf(-10.0 * t) * ((t * 10.0 - 0.75) * C4).sin() + 1.0
        }
    }

    /// Bounce ease out
    pub fn bounce_out(t: f32) -> f32 {
        const N1: f32 = 7.5625;
        const D1: f32 = 2.75;

        if t < 1.0 / D1 {
            N1 * t * t
        } else if t < 2.0 / D1 {
            let t = t - 1.5 / D1;
            N1 * t * t + 0.75
        } else if t < 2.5 / D1 {
            let t = t - 2.25 / D1;
            N1 * t * t + 0.9375
        } else {
            let t = t - 2.625 / D1;
            N1 * t * t + 0.984375
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_camera_default() {
        let camera = MomentumCamera::default();
        assert!(camera.position.z > 0.0);
        assert_eq!(camera.physics.velocity, Vec3::ZERO);
    }

    #[test]
    fn test_camera_movement() {
        let mut camera = MomentumCamera::default();
        let input = CameraInput {
            movement: Vec3::new(0.0, 0.0, -1.0), // Move forward
            is_active: true,
            ..Default::default()
        };

        let initial_z = camera.position.z;
        camera.apply_input(&input);

        // After multiple updates, camera should have moved
        for _ in 0..10 {
            camera.apply_input(&input);
        }

        // Position should have changed (moved forward = negative Z)
        assert!(camera.position.z < initial_z || camera.physics.velocity.length() > 0.0);
    }

    #[test]
    fn test_velocity_damping() {
        let mut camera = MomentumCamera::default();
        camera.physics.velocity = Vec3::new(10.0, 0.0, 0.0);

        // Apply empty input to trigger damping
        let input = CameraInput::default();
        for _ in 0..100 {
            camera.apply_input(&input);
        }

        // Velocity should approach zero
        assert!(camera.physics.velocity.length() < 0.1);
    }

    #[test]
    fn test_look_at_smooth() {
        let mut camera = MomentumCamera::default();
        let original_target = camera.target;
        let new_target = Vec3::new(10.0, 0.0, 10.0);

        camera.look_at(new_target, true);

        // Target should have moved toward new_target but not reached it instantly
        assert_ne!(camera.target, new_target);
        assert_ne!(camera.target, original_target);
    }

    #[test]
    fn test_easing_functions() {
        // Test quad_in_out
        assert!((easing::quad_in_out(0.0) - 0.0).abs() < 0.001);
        assert!((easing::quad_in_out(0.5) - 0.5).abs() < 0.001);
        assert!((easing::quad_in_out(1.0) - 1.0).abs() < 0.001);

        // Test cubic_in_out
        assert!((easing::cubic_in_out(0.0) - 0.0).abs() < 0.001);
        assert!((easing::cubic_in_out(1.0) - 1.0).abs() < 0.001);
    }

    #[test]
    fn test_trail() {
        let mut camera = MomentumCamera::default();
        camera.max_trail_length = 5;

        let input = CameraInput {
            movement: Vec3::new(1.0, 0.0, 0.0),
            is_active: true,
            ..Default::default()
        };

        for _ in 0..10 {
            camera.apply_input(&input);
        }

        // Trail should be capped at max_trail_length
        assert!(camera.trail.len() <= camera.max_trail_length);
    }
}
