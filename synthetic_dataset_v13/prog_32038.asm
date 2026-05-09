; DESCRIPTION: Draws a purple rectangle at (444, 31) with width 32 and height 15.
; PLAN: r0=444(x), r1=31(y), r2=32(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 31
LDI r2, 32
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
