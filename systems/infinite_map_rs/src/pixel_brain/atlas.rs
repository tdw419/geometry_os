use crate::hilbert;

/// Weight atlas for storing neural network weights as texture pixels.
///
/// The atlas uses Hilbert curve addressing to maintain spatial locality -
/// weights that are semantically related stay near each other in 2D texture space.
///
/// ## Memory Layout
///
/// ```text
/// ┌─────────────────────────────────────────────────────────────┐
/// │  PIXELBRAIN WEIGHT ATLAS (2048×2048 = 4M pixels)            │
/// ├─────────────────────────────────────────────────────────────┤
/// │  0x000000-0x000FFF: Token Embeddings                        │
/// │  0x001000-0x001FFF: Positional Embeddings                   │
/// │  0x002000-0x003FFF: Layer 0 Attention (Q, K, V, O)          │
/// │  0x004000-0x005FFF: Layer 0 FFN                             │
/// │  0x100000-0x1FFFFF: KV Cache (runtime)                      │
/// └─────────────────────────────────────────────────────────────┘
/// ```
#[derive(Debug, Clone)]
pub struct WeightAtlas {
    /// Texture dimension (width = height, must be power of 2)
    pub size: u32,
    /// Cached Hilbert curve for this size
    curve: hilbert::HilbertCurve,
}

impl WeightAtlas {
    /// Create a new weight atlas with the given texture size.
    ///
    /// # Arguments
    ///
    /// * `size` - Texture dimension (must be power of 2, e.g., 2048, 4096)
    ///
    /// # Panics
    ///
    /// Panics if size is not a power of 2.
    pub fn new(size: u32) -> Self {
        assert!(size.is_power_of_two(), "Atlas size must be power of 2");
        Self {
            size,
            curve: hilbert::HilbertCurve::new(size),
        }
    }

    /// Total number of pixels in the atlas.
    pub fn total_pixels(&self) -> usize {
        self.curve.total_pixels as usize
    }

    /// Convert Hilbert distance to (x, y) texture coordinates.
    #[inline]
    pub fn hilbert_d2xy(&self, d: u64) -> (u32, u32) {
        self.curve.d2xy(d)
    }

    /// Convert (x, y) texture coordinates to Hilbert distance.
    #[inline]
    pub fn hilbert_xy2d(&self, x: u32, y: u32) -> u64 {
        self.curve.xy2d(x, y)
    }

    /// Load weights from PNG bytes into a flat vector.
    ///
    /// The PNG is expected to be an RGBA image where each pixel encodes
    /// one Float16 weight in the R and G channels (B and A are metadata).
    pub fn load_from_png_bytes(
        data: &[u8],
    ) -> Result<Vec<f32>, Box<dyn std::error::Error + Send + Sync>> {
        let img = image::load_from_memory(data)?;
        let rgba = img.to_rgba8();

        let mut weights = Vec::with_capacity((rgba.width() * rgba.height()) as usize);
        for pixel in rgba.pixels() {
            weights.push(decode_weight_f16(pixel.0));
        }

        Ok(weights)
    }

    /// Load weights from a PNG file.
    pub fn load_from_png_file(
        path: &str,
    ) -> Result<Vec<f32>, Box<dyn std::error::Error + Send + Sync>> {
        let data = std::fs::read(path)?;
        Self::load_from_png_bytes(&data)
    }
}

/// Encode a float32 weight as RGBA bytes (float16 in lower 2 bytes)
pub fn encode_weight_f16(value: f32) -> [u8; 4] {
    let bits = half::f16::from_f32(value).to_bits();
    [bits as u8, (bits >> 8) as u8, 0, 0]
}

/// Decode RGBA bytes to float32 weight
pub fn decode_weight_f16(rgba: [u8; 4]) -> f32 {
    let bits = rgba[0] as u16 | ((rgba[1] as u16) << 8);
    half::f16::from_bits(bits).to_f32()
}

/// Encode a float32 weight as Rgba16Float (8 bytes: 4 half-floats)
/// Weight stored in R channel, GBA set to zero for metadata extensions
pub fn encode_weight_rgba16float(value: f32) -> [u8; 8] {
    let r_bits = half::f16::from_f32(value).to_bits();
    let g_bits: u16 = 0;
    let b_bits: u16 = 0;
    let a_bits: u16 = 0;

    // Pack as little-endian u16 pairs
    let mut result = [0u8; 8];
    result[0] = r_bits as u8;
    result[1] = (r_bits >> 8) as u8;
    result[2] = g_bits as u8;
    result[3] = (g_bits >> 8) as u8;
    result[4] = b_bits as u8;
    result[5] = (b_bits >> 8) as u8;
    result[6] = a_bits as u8;
    result[7] = (a_bits >> 8) as u8;
    result
}

/// Decode Rgba16Float bytes to float32 weight (reads R channel only)
pub fn decode_weight_rgba16float(data: &[u8; 8]) -> f32 {
    let r_bits = data[0] as u16 | ((data[1] as u16) << 8);
    half::f16::from_bits(r_bits).to_f32()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_atlas_dimensions() {
        let atlas = WeightAtlas::new(2048);
        assert_eq!(atlas.size, 2048);
        assert_eq!(atlas.total_pixels(), 2048 * 2048);
    }

    #[test]
    fn test_hilbert_roundtrip() {
        let atlas = WeightAtlas::new(4096);
        for d in [0u64, 1, 2, 3, 100, 1000, 0xFFFFFF] {
            let (x, y) = atlas.hilbert_d2xy(d);
            let recovered = atlas.hilbert_xy2d(x, y);
            assert_eq!(d, recovered, "Round trip failed for d={}", d);
        }
    }

    #[test]
    fn test_weight_encoding_roundtrip() {
        let test_values = [0.0, 0.5, -0.5, 1.0, -1.0, 0.1234, -0.9876];
        for v in test_values {
            let encoded = encode_weight_f16(v);
            let decoded = decode_weight_f16(encoded);
            assert!((v - decoded).abs() < 0.001, "Failed for {}", v);
        }
    }

    #[test]
    fn test_load_png_weights() {
        // Create a small test PNG in memory
        let mut img = image::ImageBuffer::<image::Rgba<u8>, Vec<u8>>::new(4, 4);

        // float16(1.0) = 0x3C00 -> R=0x00, G=0x3C
        img.put_pixel(0, 0, image::Rgba([0x00, 0x3C, 0, 255]));
        // float16(-1.0) = 0xBC00 -> R=0x00, G=0xBC
        img.put_pixel(1, 0, image::Rgba([0x00, 0xBC, 0, 255]));

        let mut cursor = std::io::Cursor::new(Vec::new());
        img.write_to(&mut cursor, image::ImageFormat::Png).unwrap();

        let weights = WeightAtlas::load_from_png_bytes(&cursor.into_inner()).unwrap();
        assert_eq!(weights.len(), 16); // 4x4 = 16 pixels
        assert!(
            (weights[0] - 1.0).abs() < 0.01,
            "Expected 1.0, got {}",
            weights[0]
        );
        assert!(
            (weights[1] - (-1.0)).abs() < 0.01,
            "Expected -1.0, got {}",
            weights[1]
        );
    }
}
