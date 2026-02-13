# systems/pixel_compiler/tests/test_feedback_loop.py
import pytest
import numpy as np
import time
from systems.pixel_compiler.feedback_loop import FeedbackLoop
from systems.pixel_compiler.virtual_framebuffer import VirtualFramebuffer


class TestFeedbackLoop:
    def test_create_feedback_loop(self):
        fb = VirtualFramebuffer(100, 100)
        loop = FeedbackLoop(fb)
        assert loop.timeout_ms == 2000

    def test_wait_for_change_detects_change(self):
        fb = VirtualFramebuffer(100, 100)
        loop = FeedbackLoop(fb, poll_interval_ms=10, timeout_ms=100)

        # Capture before state
        loop.capture_before()

        # Make a change
        fb.fill_rect(10, 10, 20, 20, (255, 0, 0, 255))

        # Should detect change immediately
        changed = loop.wait_for_change()
        assert changed is True

    def test_wait_for_change_times_out(self):
        fb = VirtualFramebuffer(100, 100)
        loop = FeedbackLoop(fb, poll_interval_ms=10, timeout_ms=50)

        loop.capture_before()
        # Don't make any changes

        changed = loop.wait_for_change()
        assert changed is False

    def test_get_diff_mask(self):
        fb = VirtualFramebuffer(100, 100)
        loop = FeedbackLoop(fb)

        loop.capture_before()
        fb.fill_rect(10, 10, 20, 20, (255, 0, 0, 255))

        mask = loop.get_diff_mask()
        assert mask.shape == (100, 100)
        # Check that changed area is marked
        assert mask[15, 15] == True
        # Check that unchanged area is not marked
        assert mask[50, 50] == False

    def test_verify_change_with_threshold(self):
        fb = VirtualFramebuffer(100, 100)
        loop = FeedbackLoop(fb)

        loop.capture_before()
        fb.fill_rect(0, 0, 100, 100, (1, 1, 1, 1))  # Tiny change

        # Should not detect with high threshold
        assert loop.has_significant_change(threshold=0.5) is False

        # Should detect with low threshold
        assert loop.has_significant_change(threshold=0.001) is True

    def test_get_change_percentage(self):
        fb = VirtualFramebuffer(100, 100)
        loop = FeedbackLoop(fb)

        loop.capture_before()
        # Change 25% of pixels
        fb.fill_rect(0, 0, 50, 50, (255, 0, 0, 255))

        pct = loop.get_change_percentage()
        assert 0.20 < pct < 0.30  # Approximately 25%

    def test_capture_before_sets_snapshot(self):
        fb = VirtualFramebuffer(100, 100)
        loop = FeedbackLoop(fb)

        assert loop.before_snapshot is None
        loop.capture_before()
        assert loop.before_snapshot is not None
        assert loop.before_snapshot.shape == (100, 100, 4)
