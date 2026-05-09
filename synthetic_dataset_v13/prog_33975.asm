; DESCRIPTION: Draws a purple rectangle at (343, 137) with width 32 and height 39.
; PLAN: r0=343(x), r1=137(y), r2=32(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 137
LDI r2, 32
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
