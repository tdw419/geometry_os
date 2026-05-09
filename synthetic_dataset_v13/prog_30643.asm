; DESCRIPTION: Draws a purple rectangle at (441, 62) with width 51 and height 40.
; PLAN: r0=441(x), r1=62(y), r2=51(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 62
LDI r2, 51
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
