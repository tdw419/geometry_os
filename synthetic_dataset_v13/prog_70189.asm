; DESCRIPTION: Draws a purple rectangle at (288, 38) with width 51 and height 90.
; PLAN: r0=288(x), r1=38(y), r2=51(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 38
LDI r2, 51
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
