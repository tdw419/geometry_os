; DESCRIPTION: Draws a red rectangle at (257, 14) with width 119 and height 114.
; PLAN: r0=257(x), r1=14(y), r2=119(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 14
LDI r2, 119
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
