; DESCRIPTION: Draws a purple rectangle at (51, 103) with width 65 and height 11.
; PLAN: r0=51(x), r1=103(y), r2=65(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 103
LDI r2, 65
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
