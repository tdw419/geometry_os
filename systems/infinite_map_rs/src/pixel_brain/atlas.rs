use crate::hilbert;

/// Weight atlas for storing neural network weights as texture pixels
pub struct WeightAtlas {
    pub size: u32,
}

impl WeightAtlas {
    pub fn new(size: u32) -> Self {
        Self { size }
    }

    pub fn total_pixels(&self) -> usize {
        (self.size as usize) * (self.size as usize)
    }

    /// Convert Hilbert distance to (x, y) coordinates
    pub fn hilbert_d2xy(&self, d: u64) -> (u32, u32) {
        hilbert::d2xy(self.size, d)
    }

    /// Convert (x, y) coordinates to Hilbert distance
    pub fn hilbert_xy2d(&self, x: u32, y: u32) -> u64 {
        hilbert::xy2d(self.size, x, y)
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
        for d in [0, 1, 2, 3, 100, 1000, 0xFFFFFF] {
            let (x, y) = atlas.hilbert_d2xy(d);
            let recovered = atlas.hilbert_xy2d(x, y);
            assert_eq!(d, recovered);
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
}
