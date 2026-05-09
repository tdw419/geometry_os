; DESCRIPTION: Draws a purple rectangle at (204, 77) with width 105 and height 13.
; PLAN: r0=204(x), r1=77(y), r2=105(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 77
LDI r2, 105
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
