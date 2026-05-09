; DESCRIPTION: Draws a purple rectangle at (51, 51) with width 18 and height 79.
; PLAN: r0=51(x), r1=51(y), r2=18(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 51
LDI r2, 18
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
