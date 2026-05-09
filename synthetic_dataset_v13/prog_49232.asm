; DESCRIPTION: Draws a purple rectangle at (133, 51) with width 43 and height 25.
; PLAN: r0=133(x), r1=51(y), r2=43(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 51
LDI r2, 43
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
