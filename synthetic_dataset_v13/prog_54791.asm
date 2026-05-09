; DESCRIPTION: Draws a purple rectangle at (72, 26) with width 51 and height 96.
; PLAN: r0=72(x), r1=26(y), r2=51(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 26
LDI r2, 51
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
