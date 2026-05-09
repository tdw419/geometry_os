; DESCRIPTION: Draws a magenta rectangle at (257, 198) with width 48 and height 20.
; PLAN: r0=257(x), r1=198(y), r2=48(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 198
LDI r2, 48
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
