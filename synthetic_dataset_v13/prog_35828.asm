; DESCRIPTION: Draws a magenta rectangle at (257, 37) with width 96 and height 70.
; PLAN: r0=257(x), r1=37(y), r2=96(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 37
LDI r2, 96
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
