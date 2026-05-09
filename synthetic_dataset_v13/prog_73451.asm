; DESCRIPTION: Draws a purple rectangle at (318, 227) with width 32 and height 25.
; PLAN: r0=318(x), r1=227(y), r2=32(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 227
LDI r2, 32
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
