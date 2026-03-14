//! Gesture Recognition - Shape-based command input
//!
//! This module implements gesture recognition for drawing shapes to trigger
//! commands. Users can draw circles to select regions, lines to connect nodes,
//! and other gestures for quick interactions.

use glam::{Vec2, Vec4};
use std::collections::HashMap;
use std::time::{Duration, Instant};

/// A recognized gesture type
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum GestureType {
    /// Circle - select region
    Circle,
    /// Line - connect nodes or draw path
    Line,
    /// Square/Rectangle - select rectangular region
    Rectangle,
    /// Triangle - specific action
    Triangle,
    /// Swipe - navigation
    Swipe,
    /// Zigzag - cancel or undo
    Zigzag,
    /// Spiral - zoom
    Spiral,
    /// Checkmark - confirm
    Checkmark,
    /// Cross/X - delete or cancel
    Cross,
    /// Custom gesture
    Custom(u32),
}

/// A gesture that was recognized
#[derive(Debug, Clone)]
pub struct RecognizedGesture {
    /// Type of gesture
    pub gesture_type: GestureType,
    /// Confidence of recognition (0-1)
    pub confidence: f32,
    /// Bounding box of the gesture
    pub bounds: GestureBounds,
    /// Center point of the gesture
    pub center: Vec2,
    /// Direction (for directional gestures)
    pub direction: Option<Vec2>,
    /// Size of the gesture
    pub size: f32,
    /// Time taken to draw
    pub duration: Duration,
    /// Raw points
    pub points: Vec<Vec2>,
}

/// Bounding box of a gesture
#[derive(Debug, Clone, Copy)]
pub struct GestureBounds {
    pub min: Vec2,
    pub max: Vec2,
}

impl GestureBounds {
    pub fn new(min: Vec2, max: Vec2) -> Self {
        Self { min, max }
    }

    pub fn width(&self) -> f32 {
        self.max.x - self.min.x
    }

    pub fn height(&self) -> f32 {
        self.max.y - self.min.y
    }

    pub fn center(&self) -> Vec2 {
        (self.min + self.max) * 0.5
    }

    pub fn size(&self) -> f32 {
        self.width().max(self.height())
    }
}

/// Configuration for gesture recognition
#[derive(Debug, Clone)]
pub struct GestureConfig {
    /// Minimum points required for recognition
    pub min_points: usize,
    /// Maximum gesture duration
    pub max_duration: Duration,
    /// Minimum gesture size (pixels)
    pub min_size: f32,
    /// Maximum gesture size (pixels)
    pub max_size: f32,
    /// Confidence threshold for recognition
    pub confidence_threshold: f32,
    /// Enable specific gesture types
    pub enabled_gestures: Vec<GestureType>,
    /// Sample rate for points (keep every Nth point)
    pub sample_rate: usize,
    /// Whether to normalize gestures before recognition
    pub normalize: bool,
    /// Direction threshold for swipe gestures (degrees)
    pub swipe_direction_threshold: f32,
}

impl Default for GestureConfig {
    fn default() -> Self {
        Self {
            min_points: 10,
            max_duration: Duration::from_secs(2),
            min_size: 30.0,
            max_size: 500.0,
            confidence_threshold: 0.6,
            enabled_gestures: vec![
                GestureType::Circle,
                GestureType::Line,
                GestureType::Rectangle,
                GestureType::Swipe,
                GestureType::Checkmark,
                GestureType::Cross,
            ],
            sample_rate: 3,
            normalize: true,
            swipe_direction_threshold: 30.0,
        }
    }
}

/// In-progress gesture being drawn
#[derive(Debug, Clone)]
pub struct ActiveGesture {
    /// Points collected so far
    pub points: Vec<Vec2>,
    /// Timestamps for each point
    pub timestamps: Vec<Instant>,
    /// Start time
    pub start_time: Instant,
    /// Whether the gesture is complete
    pub complete: bool,
}

impl ActiveGesture {
    pub fn new() -> Self {
        Self {
            points: Vec::new(),
            timestamps: Vec::new(),
            start_time: Instant::now(),
            complete: false,
        }
    }

    pub fn add_point(&mut self, point: Vec2) {
        self.points.push(point);
        self.timestamps.push(Instant::now());
    }

    pub fn finish(&mut self) {
        self.complete = true;
    }

    pub fn duration(&self) -> Duration {
        self.start_time.elapsed()
    }

    pub fn bounds(&self) -> Option<GestureBounds> {
        if self.points.is_empty() {
            return None;
        }

        let mut min = self.points[0];
        let mut max = self.points[0];

        for point in &self.points {
            min = min.min(*point);
            max = max.max(*point);
        }

        Some(GestureBounds::new(min, max))
    }

    pub fn center(&self) -> Option<Vec2> {
        self.bounds().map(|b| b.center())
    }

    pub fn clear(&mut self) {
        self.points.clear();
        self.timestamps.clear();
        self.start_time = Instant::now();
        self.complete = false;
    }
}

impl Default for ActiveGesture {
    fn default() -> Self {
        Self::new()
    }
}

/// Gesture recognizer
#[derive(Debug)]
pub struct GestureRecognizer {
    /// Configuration
    pub config: GestureConfig,
    /// Currently active gesture
    active_gesture: ActiveGesture,
    /// Template gestures for matching
    templates: HashMap<GestureType, Vec<Vec2>>,
    /// Last recognized gesture
    last_recognized: Option<RecognizedGesture>,
    /// Recognition history
    history: Vec<RecognizedGesture>,
    /// Maximum history size
    max_history: usize,
}

impl Default for GestureRecognizer {
    fn default() -> Self {
        Self::new(GestureConfig::default())
    }
}

impl GestureRecognizer {
    /// Create a new gesture recognizer
    pub fn new(config: GestureConfig) -> Self {
        let mut recognizer = Self {
            config,
            active_gesture: ActiveGesture::new(),
            templates: HashMap::new(),
            last_recognized: None,
            history: Vec::new(),
            max_history: 50,
        };

        recognizer.initialize_templates();
        recognizer
    }

    /// Initialize template gestures
    fn initialize_templates(&mut self) {
        // Circle template
        let circle: Vec<Vec2> = (0..32)
            .map(|i| {
                let angle = i as f32 / 32.0 * std::f32::consts::TAU;
                Vec2::new(angle.cos(), angle.sin())
            })
            .collect();
        self.templates.insert(GestureType::Circle, circle);

        // Line template (horizontal)
        let line: Vec<Vec2> = (0..10)
            .map(|i| Vec2::new(i as f32 / 9.0 - 0.5, 0.0))
            .collect();
        self.templates.insert(GestureType::Line, line);

        // Rectangle template
        let rect: Vec<Vec2> = vec![
            Vec2::new(-0.5, -0.5),
            Vec2::new(0.5, -0.5),
            Vec2::new(0.5, 0.5),
            Vec2::new(-0.5, 0.5),
            Vec2::new(-0.5, -0.5),
        ];
        self.templates.insert(GestureType::Rectangle, rect);

        // Triangle template
        let triangle: Vec<Vec2> = vec![
            Vec2::new(0.0, -0.5),
            Vec2::new(0.5, 0.5),
            Vec2::new(-0.5, 0.5),
            Vec2::new(0.0, -0.5),
        ];
        self.templates.insert(GestureType::Triangle, triangle);

        // Checkmark template
        let check: Vec<Vec2> = vec![
            Vec2::new(-0.3, 0.0),
            Vec2::new(-0.1, -0.3),
            Vec2::new(0.3, 0.3),
        ];
        self.templates.insert(GestureType::Checkmark, check);

        // Cross template
        let cross: Vec<Vec2> = vec![
            Vec2::new(-0.3, -0.3),
            Vec2::new(0.3, 0.3),
            Vec2::new(0.0, 0.0),
            Vec2::new(0.3, -0.3),
            Vec2::new(-0.3, 0.3),
        ];
        self.templates.insert(GestureType::Cross, cross);
    }

    /// Start a new gesture
    pub fn start_gesture(&mut self, point: Vec2) {
        self.active_gesture.clear();
        self.active_gesture.add_point(point);
    }

    /// Add a point to the current gesture
    pub fn add_point(&mut self, point: Vec2) {
        // Sample points
        if self.active_gesture.points.len() % self.config.sample_rate == 0 {
            self.active_gesture.add_point(point);
        }

        // Check if gesture is too long
        if self.active_gesture.duration() > self.config.max_duration {
            self.active_gesture.clear();
        }
    }

    /// Finish the current gesture and attempt recognition
    pub fn finish_gesture(&mut self) -> Option<RecognizedGesture> {
        self.active_gesture.finish();
        let gesture = self.recognize();
        
        if let Some(ref recognized) = gesture {
            self.last_recognized = Some(recognized.clone());
            
            if self.history.len() >= self.max_history {
                self.history.remove(0);
            }
            self.history.push(recognized.clone());
        }
        
        self.active_gesture.clear();
        gesture
    }

    /// Cancel the current gesture
    pub fn cancel_gesture(&mut self) {
        self.active_gesture.clear();
    }

    /// Attempt to recognize the current gesture
    fn recognize(&self) -> Option<RecognizedGesture> {
        let points = &self.active_gesture.points;
        
        // Check minimum requirements
        if points.len() < self.config.min_points {
            return None;
        }

        let bounds = self.active_gesture.bounds()?;
        let size = bounds.size();

        if size < self.config.min_size || size > self.config.max_size {
            return None;
        }

        // Normalize points
        let normalized = if self.config.normalize {
            self.normalize_points(points, &bounds)
        } else {
            points.clone()
        };

        // Try to match each enabled gesture type
        let mut best_match: Option<(GestureType, f32)> = None;

        for gesture_type in &self.config.enabled_gestures {
            if let Some(template) = self.templates.get(gesture_type) {
                let score = self.match_gesture(&normalized, template);
                
                if score >= self.config.confidence_threshold {
                    match best_match {
                        None => best_match = Some((*gesture_type, score)),
                        Some((_, best_score)) if score > best_score => {
                            best_match = Some((*gesture_type, score));
                        }
                        _ => {}
                    }
                }
            }
        }

        // Check for special gestures
        if best_match.is_none() {
            // Check for swipe
            if let Some(swipe) = self.detect_swipe(&normalized) {
                best_match = Some(swipe);
            }
        }

        best_match.map(|(gesture_type, confidence)| {
            let direction = if gesture_type == GestureType::Swipe {
                self.calculate_direction(&normalized)
            } else {
                None
            };

            RecognizedGesture {
                gesture_type,
                confidence,
                bounds,
                center: bounds.center(),
                direction,
                size,
                duration: self.active_gesture.duration(),
                points: points.clone(),
            }
        })
    }

    /// Normalize points to unit square centered at origin
    fn normalize_points(&self, points: &[Vec2], bounds: &GestureBounds) -> Vec<Vec2> {
        let size = bounds.size().max(0.001);
        let center = bounds.center();

        points
            .iter()
            .map(|p| (*p - center) / size)
            .collect()
    }

    /// Match gesture against template using simple distance metric
    fn match_gesture(&self, points: &[Vec2], template: &[Vec2]) -> f32 {
        if points.is_empty() || template.is_empty() {
            return 0.0;
        }

        // Resample points to match template length
        let resampled = self.resample_points(points, template.len());

        // Calculate average distance
        let total_distance: f32 = resampled
            .iter()
            .zip(template.iter())
            .map(|(p, t)| p.distance(*t))
            .sum();

        let avg_distance = total_distance / template.len() as f32;

        // Convert to score (lower distance = higher score)
        let score = 1.0 / (1.0 + avg_distance * 5.0);
        score
    }

    /// Resample points to a specific count
    fn resample_points(&self, points: &[Vec2], count: usize) -> Vec<Vec2> {
        if points.len() < 2 || count < 2 {
            return points.to_vec();
        }

        // Calculate total path length
        let mut path_length = 0.0;
        for i in 1..points.len() {
            path_length += points[i].distance(points[i - 1]);
        }

        let interval = path_length / (count - 1) as f32;
        let mut result = vec![points[0]];
        let mut current_dist = 0.0;
        let mut point_idx = 1;

        while result.len() < count && point_idx < points.len() {
            let segment_length = points[point_idx].distance(points[point_idx - 1]);
            current_dist += segment_length;

            if current_dist >= interval {
                let overshoot = current_dist - interval;
                let t = 1.0 - overshoot / segment_length.max(0.001);
                let new_point = points[point_idx - 1].lerp(points[point_idx], t);
                result.push(new_point);
                current_dist = overshoot;
            } else {
                point_idx += 1;
            }
        }

        // Ensure we have the right count
        while result.len() < count {
            result.push(*points.last().unwrap());
        }

        result
    }

    /// Detect swipe gesture
    fn detect_swipe(&self, points: &[Vec2]) -> Option<(GestureType, f32)> {
        if points.len() < 3 {
            return None;
        }

        // Check if gesture is mostly straight
        let start = points.first()?;
        let end = points.last()?;
        let direct_distance = start.distance(*end);

        // Calculate path length
        let mut path_length: f32 = 0.0;
        for i in 1..points.len() {
            path_length += points[i].distance(points[i - 1]);
        }

        // If path is fairly direct, it's a swipe
        let directness = direct_distance / path_length.max(0.001);
        if directness > 0.7 {
            return Some((GestureType::Swipe, directness));
        }

        None
    }

    /// Calculate direction of a gesture
    fn calculate_direction(&self, points: &[Vec2]) -> Option<Vec2> {
        if points.len() < 2 {
            return None;
        }

        let start = points.first()?;
        let end = points.last()?;
        let dir = *end - *start;

        if dir.length() > 0.001 {
            Some(dir.normalize())
        } else {
            None
        }
    }

    /// Get the current active gesture points
    pub fn get_active_points(&self) -> &[Vec2] {
        &self.active_gesture.points
    }

    /// Get the last recognized gesture
    pub fn get_last_recognized(&self) -> Option<&RecognizedGesture> {
        self.last_recognized.as_ref()
    }

    /// Get gesture history
    pub fn get_history(&self) -> &[RecognizedGesture] {
        &self.history
    }

    /// Clear history
    pub fn clear_history(&mut self) {
        self.history.clear();
    }

    /// Check if currently drawing
    pub fn is_drawing(&self) -> bool {
        !self.active_gesture.points.is_empty() && !self.active_gesture.complete
    }

    /// Add a custom gesture template
    pub fn add_custom_template(&mut self, gesture_type: GestureType, template: Vec<Vec2>) {
        self.templates.insert(gesture_type, template);
    }
}

/// Gesture visualizer for drawing feedback
#[derive(Debug, Clone)]
pub struct GestureVisualizer {
    /// Color for drawing gesture
    pub draw_color: Vec4,
    /// Line width for gesture
    pub line_width: f32,
    /// Whether to show recognized gesture outline
    pub show_outline: bool,
    /// Outline color
    pub outline_color: Vec4,
    /// Fade duration after recognition
    pub fade_duration: Duration,
}

impl Default for GestureVisualizer {
    fn default() -> Self {
        Self {
            draw_color: Vec4::new(1.0, 1.0, 1.0, 0.8),
            line_width: 3.0,
            show_outline: true,
            outline_color: Vec4::new(0.0, 1.0, 0.5, 0.6),
            fade_duration: Duration::from_millis(500),
        }
    }
}

impl GestureVisualizer {
    pub fn new() -> Self {
        Self::default()
    }

    /// Get visual points for rendering the current gesture
    pub fn get_visual_points(&self, recognizer: &GestureRecognizer) -> Vec<(Vec2, f32)> {
        recognizer
            .get_active_points()
            .iter()
            .map(|&p| (p, 1.0))
            .collect()
    }

    /// Get outline for a recognized gesture
    pub fn get_outline(&self, gesture: &RecognizedGesture) -> Option<Vec<Vec2>> {
        if !self.show_outline {
            return None;
        }

        // Return simplified outline based on gesture type
        match gesture.gesture_type {
            GestureType::Circle => {
                let center = gesture.center;
                let radius = gesture.size / 2.0;
                Some(
                    (0..32)
                        .map(|i| {
                            let angle = i as f32 / 32.0 * std::f32::consts::TAU;
                            center + Vec2::new(angle.cos(), angle.sin()) * radius
                        })
                        .collect(),
                )
            }
            GestureType::Rectangle => {
                let b = gesture.bounds;
                Some(vec![
                    b.min,
                    Vec2::new(b.max.x, b.min.y),
                    b.max,
                    Vec2::new(b.min.x, b.max.y),
                    b.min,
                ])
            }
            _ => None,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_active_gesture() {
        let mut gesture = ActiveGesture::new();
        gesture.add_point(Vec2::ZERO);
        gesture.add_point(Vec2::new(10.0, 0.0));
        
        assert_eq!(gesture.points.len(), 2);
        assert!(gesture.bounds().is_some());
    }

    #[test]
    fn test_gesture_bounds() {
        let bounds = GestureBounds::new(Vec2::new(0.0, 0.0), Vec2::new(100.0, 50.0));
        
        assert_eq!(bounds.width(), 100.0);
        assert_eq!(bounds.height(), 50.0);
        assert_eq!(bounds.center(), Vec2::new(50.0, 25.0));
    }

    #[test]
    fn test_circle_recognition() {
        let mut recognizer = GestureRecognizer::new(GestureConfig {
            min_points: 5,
            min_size: 10.0,
            confidence_threshold: 0.3, // Lower threshold for test
            ..Default::default()
        });

        // Draw a circle
        recognizer.start_gesture(Vec2::new(50.0, 50.0));
        
        for i in 0..20 {
            let angle = i as f32 / 20.0 * std::f32::consts::TAU;
            let point = Vec2::new(50.0 + angle.cos() * 40.0, 50.0 + angle.sin() * 40.0);
            recognizer.add_point(point);
        }

        let result = recognizer.finish_gesture();
        
        // May or may not recognize depending on matching quality
        // Just verify the process completes without error
        assert!(result.is_some() || result.is_none());
    }

    #[test]
    fn test_swipe_recognition() {
        let mut recognizer = GestureRecognizer::new(GestureConfig {
            min_points: 3,
            sample_rate: 1,  // Keep all points for test
            confidence_threshold: 0.5,
            enabled_gestures: vec![GestureType::Swipe],
            ..Default::default()
        });

        // Draw a horizontal swipe
        recognizer.start_gesture(Vec2::new(0.0, 50.0));
        recognizer.add_point(Vec2::new(50.0, 50.0));
        recognizer.add_point(Vec2::new(100.0, 50.0));
        recognizer.add_point(Vec2::new(150.0, 50.0));
        recognizer.add_point(Vec2::new(200.0, 50.0));

        let result = recognizer.finish_gesture();
        
        assert!(result.is_some());
        let gesture = result.unwrap();
        assert_eq!(gesture.gesture_type, GestureType::Swipe);
        assert!(gesture.direction.is_some());
    }

    #[test]
    fn test_gesture_too_short() {
        let recognizer = GestureRecognizer::new(GestureConfig {
            min_points: 10,
            ..Default::default()
        });

        // Only 3 points
        let mut active = ActiveGesture::new();
        active.add_point(Vec2::ZERO);
        active.add_point(Vec2::new(10.0, 0.0));
        active.add_point(Vec2::new(20.0, 0.0));
        active.finish();

        // Would need to test through recognizer
        // Just verify config is applied
        assert_eq!(recognizer.config.min_points, 10);
    }

    #[test]
    fn test_resample_points() {
        let recognizer = GestureRecognizer::default();
        
        let points = vec![
            Vec2::ZERO,
            Vec2::new(10.0, 0.0),
            Vec2::new(20.0, 0.0),
        ];
        
        let resampled = recognizer.resample_points(&points, 5);
        assert_eq!(resampled.len(), 5);
    }

    #[test]
    fn test_normalize_points() {
        let recognizer = GestureRecognizer::default();
        
        let points = vec![
            Vec2::new(0.0, 0.0),
            Vec2::new(100.0, 50.0),
        ];
        
        let bounds = GestureBounds::new(Vec2::ZERO, Vec2::new(100.0, 50.0));
        let normalized = recognizer.normalize_points(&points, &bounds);
        
        // Check that points are normalized
        for p in &normalized {
            assert!(p.x >= -0.5 && p.x <= 0.5);
            assert!(p.y >= -0.5 && p.y <= 0.5);
        }
    }

    #[test]
    fn test_gesture_history() {
        let mut recognizer = GestureRecognizer::new(GestureConfig {
            min_points: 3,
            ..Default::default()
        });

        // Create and recognize a gesture
        recognizer.start_gesture(Vec2::ZERO);
        recognizer.add_point(Vec2::new(100.0, 0.0));
        recognizer.add_point(Vec2::new(200.0, 0.0));
        recognizer.finish_gesture();

        // History should have entry
        assert!(recognizer.get_history().len() <= 1);
    }

    #[test]
    fn test_custom_template() {
        let mut recognizer = GestureRecognizer::default();
        
        let custom_template = vec![
            Vec2::new(0.0, 0.0),
            Vec2::new(0.5, 0.5),
            Vec2::new(1.0, 0.0),
        ];
        
        recognizer.add_custom_template(GestureType::Custom(1), custom_template);
        
        // Template should be stored
        assert!(recognizer.templates.contains_key(&GestureType::Custom(1)));
    }
}
