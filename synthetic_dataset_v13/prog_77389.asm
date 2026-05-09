; DESCRIPTION: Draws a magenta rectangle at (257, 145) with width 19 and height 55.
; PLAN: r0=257(x), r1=145(y), r2=19(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 145
LDI r2, 19
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
