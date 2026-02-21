// ============================================
// GEOMETRY OS - RTS TEXTURE LOADER
// Loads geometry_os.rts as a live background texture
// ============================================

use image::{DynamicImage, GenericImageView, ImageBuffer, Rgba};
use std::path::Path;

pub struct RTSTexture {
    pub image: DynamicImage,
    pub width: u32,
    pub height: u32,
}

impl RTSTexture {
    /// Load an RTS file (PNG format) as a texture
    pub fn load<P: AsRef<Path>>(path: P) -> Result<Self, Box<dyn std::error::Error>> {
        let image = image::open(path)?;
        let width = image.width();
        let height = image.height();

        Ok(RTSTexture {
            image,
            width,
            height,
        })
    }

    /// Create a blank RTS texture (for testing)
    #[allow(dead_code)]
    pub fn create_blank(width: u32, height: u32) -> Self {
        let image: ImageBuffer<Rgba<u8>, Vec<u8>> = ImageBuffer::new(width, height);
        let dynamic = DynamicImage::ImageRgba8(image);

        RTSTexture {
            image: dynamic,
            width,
            height,
        }
    }

    /// Get raw RGBA bytes for GPU upload
    pub fn as_rgba_bytes(&self) -> Vec<u8> {
        self.image.to_rgba8().into_raw()
    }

    /// Get pixel color at world coordinates (Hilbert-mapped)
    /// This is a placeholder - actual Hilbert mapping will be done in shader
    #[allow(dead_code)]
    pub fn get_pixel_color(&self, x: u32, y: u32) -> (u8, u8, u8, u8) {
        let pixel = self
            .image
            .get_pixel(x.min(self.width - 1), y.min(self.height - 1));
        (pixel[0], pixel[1], pixel[2], pixel[3])
    }

    /// Create a test pattern texture (for development)
    pub fn create_test_pattern(width: u32, height: u32) -> Self {
        let mut image: ImageBuffer<Rgba<u8>, Vec<u8>> = ImageBuffer::new(width, height);

        for y in 0..height {
            for x in 0..width {
                // Create a gradient pattern
                let r = ((x as f32 / width as f32) * 255.0) as u8;
                let g = ((y as f32 / height as f32) * 255.0) as u8;
                let b = 128;
                let a = 255;

                image.put_pixel(x, y, Rgba([r, g, b, a]));
            }
        }

        RTSTexture {
            image: DynamicImage::ImageRgba8(image),
            width,
            height,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_create_blank() {
        let texture = RTSTexture::create_blank(100, 100);
        assert_eq!(texture.width, 100);
        assert_eq!(texture.height, 100);
    }

    #[test]
    fn test_test_pattern() {
        let texture = RTSTexture::create_test_pattern(100, 100);
        assert_eq!(texture.width, 100);
        assert_eq!(texture.height, 100);

        let bytes = texture.as_rgba_bytes();
        assert_eq!(bytes.len(), 100 * 100 * 4);
    }
}
