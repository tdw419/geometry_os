; DESCRIPTION: Places a magenta 32x101 rectangle at position (320, 154).
; PLAN: r0=320(x), r1=154(y), r2=32(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 154
LDI r2, 32
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
