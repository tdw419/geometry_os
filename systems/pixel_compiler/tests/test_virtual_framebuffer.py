# systems/pixel_compiler/tests/test_virtual_framebuffer.py
import pytest
import numpy as np
from systems.pixel_compiler.virtual_framebuffer import VirtualFramebuffer


class TestVirtualFramebuffer:
    def test_create_framebuffer(self):
        fb = VirtualFramebuffer(800, 600)
        assert fb.width == 800
        assert fb.height == 600
        assert fb.pixels.shape == (600, 800, 4)

    def test_default_pixels_are_black(self):
        fb = VirtualFramebuffer(100, 100)
        assert np.all(fb.pixels == 0)

    def test_set_pixel(self):
        fb = VirtualFramebuffer(100, 100)
        fb.set_pixel(50, 50, (255, 0, 0, 255))
        assert tuple(fb.pixels[50, 50]) == (255, 0, 0, 255)

    def test_fill_rect(self):
        fb = VirtualFramebuffer(100, 100)
        fb.fill_rect(10, 10, 30, 20, (255, 128, 0, 255))

        # Check corners of filled area
        assert tuple(fb.pixels[10, 10]) == (255, 128, 0, 255)
        assert tuple(fb.pixels[29, 39]) == (255, 128, 0, 255)

        # Check outside area is still black
        assert tuple(fb.pixels[5, 5]) == (0, 0, 0, 0)

    def test_get_region(self):
        fb = VirtualFramebuffer(100, 100)
        fb.fill_rect(0, 0, 50, 50, (255, 0, 0, 255))

        region = fb.get_region(0, 0, 50, 50)
        assert region.shape == (50, 50, 4)
        assert np.all(region[:, :, 0] == 255)  # All red

    def test_compare_identical(self):
        fb1 = VirtualFramebuffer(100, 100)
        fb2 = VirtualFramebuffer(100, 100)
        fb1.fill_rect(10, 10, 30, 30, (255, 0, 0, 255))
        fb2.fill_rect(10, 10, 30, 30, (255, 0, 0, 255))

        similarity = fb1.compare(fb2)
        assert similarity == 1.0

    def test_compare_different(self):
        fb1 = VirtualFramebuffer(100, 100)
        fb2 = VirtualFramebuffer(100, 100)
        fb1.fill_rect(0, 0, 100, 100, (255, 0, 0, 255))
        fb2.fill_rect(0, 0, 100, 100, (0, 255, 0, 255))

        similarity = fb1.compare(fb2)
        assert similarity < 0.5

    def test_get_diff_mask(self):
        fb1 = VirtualFramebuffer(100, 100)
        fb2 = VirtualFramebuffer(100, 100)
        fb1.fill_rect(10, 10, 30, 30, (255, 0, 0, 255))

        mask = fb1.get_diff_mask(fb2)
        assert mask.shape == (100, 100)
        # Changed area should be True
        assert mask[10, 10] == True
        # Unchanged area should be False
        assert mask[50, 50] == False

    def test_clear(self):
        fb = VirtualFramebuffer(100, 100)
        fb.fill_rect(0, 0, 100, 100, (255, 0, 0, 255))
        fb.clear()

        assert np.all(fb.pixels == 0)
