; DESCRIPTION: Draws a magenta rectangle at (64, 63) with width 103 and height 99.
; PLAN: r0=64(x), r1=63(y), r2=103(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 63
LDI r2, 103
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
