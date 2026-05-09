; DESCRIPTION: Draws a blue rectangle at (257, 183) with width 14 and height 61.
; PLAN: r0=257(x), r1=183(y), r2=14(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 183
LDI r2, 14
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
