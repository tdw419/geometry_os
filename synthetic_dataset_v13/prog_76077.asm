; DESCRIPTION: Draws a purple rectangle at (51, 4) with width 18 and height 85.
; PLAN: r0=51(x), r1=4(y), r2=18(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 4
LDI r2, 18
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
