; DESCRIPTION: Draws a purple rectangle at (77, 142) with width 37 and height 36.
; PLAN: r0=77(x), r1=142(y), r2=37(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 142
LDI r2, 37
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
