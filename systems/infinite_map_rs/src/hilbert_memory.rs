// src/hilbert_memory.rs
// Hilbert Curve Memory Mapper
// Maps linear memory addresses to 2D texture coordinates preserving locality
//
// The Hilbert curve is a space-filling curve that maps 1D space to 2D space
// while preserving locality: adjacent addresses map to adjacent pixels.
// This is crucial for visualizing memory patterns effectively.

/// Maps linear memory addresses to 2D texture coordinates using Hilbert curve
/// Preserves locality: adjacent addresses → adjacent pixels
#[derive(Debug, Clone)]
pub struct HilbertMemoryMapper {
    order: u32, // Hilbert curve order (N = 2^order)
    size: u32,  // Texture size (must be power of 2)
}

impl HilbertMemoryMapper {
    /// Create a new Hilbert curve mapper
    ///
    /// # Arguments
    /// * `order` - Hilbert curve order (texture size = 2^order)
    ///
    /// # Examples
    /// ```
    /// let mapper = HilbertMemoryMapper::new(8); // 256x256 texture
    /// ```
    pub fn new(order: u32) -> Self {
        let size = 2u32.pow(order);
        Self { order, size }
    }

    /// Get the texture size
    pub fn size(&self) -> u32 {
        self.size
    }

    /// Get the Hilbert curve order
    pub fn order(&self) -> u32 {
        self.order
    }

    /// Convert Hilbert curve index to (x, y) coordinates
    ///
    /// # Arguments
    /// * `index` - Linear index along the Hilbert curve
    ///
    /// # Returns
    /// (x, y) coordinates in the texture
    ///
    /// # Examples
    /// ```
    /// let mapper = HilbertMemoryMapper::new(2); // 4x4 texture
    /// let (x, y) = mapper.hilbert_index_to_xy(0);
    /// assert_eq!(x, 0);
    /// assert_eq!(y, 0);
    /// ```
    pub fn hilbert_index_to_xy(&self, index: u32) -> (u32, u32) {
        let mut x = 0u32;
        let mut y = 0u32;
        let mut s = 1u32;
        let mut idx = index;

        for _i in 0..self.order {
            let rx = 1u32 & (idx / 2);
            let ry = 1u32 & (idx ^ rx);

            self.rot(s, &mut x, &mut y, rx, ry);

            x += s * rx;
            y += s * ry;

            idx /= 4;
            s *= 2;
        }

        (x, y)
    }

    /// Rotate/flip a quadrant appropriately
    fn rot(&self, n: u32, x: &mut u32, y: &mut u32, rx: u32, ry: u32) {
        if ry == 0 {
            if rx == 1 {
                *x = n - 1 - *x;
                *y = n - 1 - *y;
            }

            // Swap x and y
            std::mem::swap(x, y);
        }
    }

    /// Convert (x, y) coordinates to Hilbert curve index
    ///
    /// # Arguments
    /// * `x` - X coordinate in texture
    /// * `y` - Y coordinate in texture
    ///
    /// # Returns
    /// Linear index along the Hilbert curve
    ///
    /// # Examples
    /// ```
    /// let mapper = HilbertMemoryMapper::new(2); // 4x4 texture
    /// let idx = mapper.xy_to_hilbert_index(0, 0);
    /// assert_eq!(idx, 0);
    /// ```
    pub fn xy_to_hilbert_index(&self, x: u32, y: u32) -> u32 {
        let mut d = 0u32;
        let mut s = 1u32;
        let mut rx = 0u32;
        let mut ry = 0u32;
        let mut xx = x;
        let mut yy = y;

        for _i in 0..self.order {
            rx = 1u32 & (xx / s);
            ry = 1u32 & (yy / s);

            d += s * s * ((3u32 * rx) ^ ry);

            self.rot(s, &mut xx, &mut yy, rx, ry);

            s *= 2;
        }

        d
    }

    /// Convert memory address to texture UV coordinates
    ///
    /// # Arguments
    /// * `addr` - Memory address
    /// * `base_addr` - Base address of memory region
    /// * `page_size` - Size of each memory page (typically 4096)
    ///
    /// # Returns
    /// (u, v) normalized texture coordinates in [0, 1]
    ///
    /// # Examples
    /// ```
    /// let mapper = HilbertMemoryMapper::new(8); // 256x256 texture
    /// let (u, v) = mapper.address_to_uv(0x10004000, 0x10000000, 4096);
    /// ```
    pub fn address_to_uv(&self, addr: usize, base_addr: usize, page_size: usize) -> (f32, f32) {
        let offset = addr - base_addr;
        let page_index = (offset / page_size) as u32;

        let (x, y) = self.hilbert_index_to_xy(page_index);

        let u = x as f32 / self.size as f32;
        let v = y as f32 / self.size as f32;

        (u, v)
    }

    /// Convert texture UV coordinates to memory address
    ///
    /// # Arguments
    /// * `u` - U coordinate in [0, 1]
    /// * `v` - V coordinate in [0, 1]
    /// * `base_addr` - Base address of memory region
    /// * `page_size` - Size of each memory page (typically 4096)
    ///
    /// # Returns
    /// Memory address
    ///
    /// # Examples
    /// ```
    /// let mapper = HilbertMemoryMapper::new(8); // 256x256 texture
    /// let addr = mapper.uv_to_address(0.5, 0.5, 0x10000000, 4096);
    /// ```
    pub fn uv_to_address(&self, u: f32, v: f32, base_addr: usize, page_size: usize) -> usize {
        let x = (u * self.size as f32) as u32;
        let y = (v * self.size as f32) as u32;

        let page_index = self.xy_to_hilbert_index(x, y);

        base_addr + (page_index as usize) * page_size
    }

    /// Get pixel coordinates for a memory address
    ///
    /// # Arguments
    /// * `addr` - Memory address
    /// * `base_addr` - Base address of memory region
    /// * `page_size` - Size of each memory page (typically 4096)
    ///
    /// # Returns
    /// (x, y) pixel coordinates in the texture
    pub fn address_to_pixel(&self, addr: usize, base_addr: usize, page_size: usize) -> (u32, u32) {
        let offset = addr - base_addr;
        let page_index = (offset / page_size) as u32;

        self.hilbert_index_to_xy(page_index)
    }

    /// Get memory address from pixel coordinates
    ///
    /// # Arguments
    /// * `x` - X pixel coordinate
    /// * `y` - Y pixel coordinate
    /// * `base_addr` - Base address of memory region
    /// * `page_size` - Size of each memory page (typically 4096)
    ///
    /// # Returns
    /// Memory address
    pub fn pixel_to_address(&self, x: u32, y: u32, base_addr: usize, page_size: usize) -> usize {
        let page_index = self.xy_to_hilbert_index(x, y);
        base_addr + (page_index as usize) * page_size
    }

    /// Calculate the maximum number of pages that can be mapped
    pub fn max_pages(&self) -> usize {
        (self.size * self.size) as usize
    }

    /// Check if an address can be mapped
    ///
    /// # Arguments
    /// * `addr` - Memory address
    /// * `base_addr` - Base address of memory region
    /// * `page_size` - Size of each memory page (typically 4096)
    ///
    /// # Returns
    /// true if the address can be mapped, false otherwise
    pub fn can_map_address(&self, addr: usize, base_addr: usize, page_size: usize) -> bool {
        if addr < base_addr {
            return false;
        }

        let offset = addr - base_addr;
        let page_index = offset / page_size;

        page_index < self.max_pages()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_hilbert_roundtrip() {
        let mapper = HilbertMemoryMapper::new(4); // 16x16 texture

        for i in 0..256 {
            let (x, y) = mapper.hilbert_index_to_xy(i);
            let j = mapper.xy_to_hilbert_index(x, y);
            assert_eq!(i, j, "Roundtrip failed for index {}", i);
        }
    }

    #[test]
    fn test_address_uv_roundtrip() {
        let mapper = HilbertMemoryMapper::new(8); // 256x256 texture
        let base_addr = 0x1000_0000;
        let page_size = 4096;

        for offset in 0..65536 {
            let addr = base_addr + offset * page_size;
            let (u, v) = mapper.address_to_uv(addr, base_addr, page_size);
            let addr2 = mapper.uv_to_address(u, v, base_addr, page_size);
            assert_eq!(addr, addr2, "Roundtrip failed for address 0x{:x}", addr);
        }
    }

    #[test]
    fn test_hilbert_locality() {
        let mapper = HilbertMemoryMapper::new(4); // 16x16

        // Test that adjacent indices map to adjacent pixels
        let (x1, y1) = mapper.hilbert_index_to_xy(0);
        let (x2, y2) = mapper.hilbert_index_to_xy(1);

        // Adjacent indices should be adjacent in either x or y
        let distance = ((x1 as i32 - x2 as i32).abs() + (y1 as i32 - y2 as i32).abs()) as f32;
        assert!(distance <= 2.0, "Hilbert curve should preserve locality");
    }

    #[test]
    fn test_max_pages() {
        let mapper = HilbertMemoryMapper::new(8); // 256x256
        assert_eq!(mapper.max_pages(), 65536);
    }

    #[test]
    fn test_can_map_address() {
        let mapper = HilbertMemoryMapper::new(8); // 256x256 = 65536 pages
        let base_addr = 0x1000_0000;
        let page_size = 4096;

        // Valid address
        let valid_addr = base_addr + 1000 * page_size;
        assert!(mapper.can_map_address(valid_addr, base_addr, page_size));

        // Invalid address (before base)
        let invalid_addr = base_addr - page_size;
        assert!(!mapper.can_map_address(invalid_addr, base_addr, page_size));

        // Invalid address (too far)
        let too_far_addr = base_addr + 70000 * page_size;
        assert!(!mapper.can_map_address(too_far_addr, base_addr, page_size));
    }

    #[test]
    fn test_pixel_address_conversion() {
        let mapper = HilbertMemoryMapper::new(4); // 16x16
        let base_addr = 0x1000_0000;
        let page_size = 4096;

        for x in 0..16 {
            for y in 0..16 {
                let addr = mapper.pixel_to_address(x, y, base_addr, page_size);
                let (x2, y2) = mapper.address_to_pixel(addr, base_addr, page_size);
                assert_eq!((x, y), (x2, y2), "Pixel conversion failed for ({}, {})", x, y);
            }
        }
    }
}
