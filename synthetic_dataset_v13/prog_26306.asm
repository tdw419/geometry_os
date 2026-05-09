; DESCRIPTION: Draws a purple rectangle at (7, 110) with width 18 and height 64.
; PLAN: r0=7(x), r1=110(y), r2=18(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 110
LDI r2, 18
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
