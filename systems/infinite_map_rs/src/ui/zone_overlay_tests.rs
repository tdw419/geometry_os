//! Integration tests for zone overlay UI
//!
//! These tests verify the overlay text generation functionality
//! as specified in the implementation plan.

#[cfg(test)]
mod tests {
    use crate::ui::zone_overlay::{
        generate_zone_overlay_text, generate_zone_overlay_text_with_position,
    };

    #[test]
    fn test_overlay_text_generation() {
        let shader_name = "test_shader.wgsl";
        let workgroup = (64, 1, 1);

        let text = generate_zone_overlay_text(shader_name, workgroup, true);

        assert!(text.contains(shader_name));
        assert!(text.contains("64x1x1"));
        assert!(text.contains("Running"));
    }

    #[test]
    fn test_overlay_text_inactive() {
        let shader_name = "inactive_shader.wgsl";
        let workgroup = (32, 2, 1);

        let text = generate_zone_overlay_text(shader_name, workgroup, false);

        assert!(text.contains(shader_name));
        assert!(text.contains("32x2x1"));
        assert!(text.contains("Inactive"));
    }

    #[test]
    fn test_overlay_text_with_position() {
        let shader_name = "positioned_shader.wgsl";
        let workgroup = (16, 16, 1);

        let text = generate_zone_overlay_text_with_position(
            shader_name,
            workgroup,
            true,
            glam::Vec2::new(100.0, 200.0),
        );

        assert!(text.contains(shader_name));
        assert!(text.contains("16x16x1"));
        assert!(text.contains("Running"));
        // Note: Vec2 Display format may vary, check for position components separately
        assert!(text.contains("Position:"));
        assert!(text.contains("100"));
        assert!(text.contains("200"));
    }
}
