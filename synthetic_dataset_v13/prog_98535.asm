; DESCRIPTION: Draws a purple rectangle at (256, 19) with width 55 and height 110.
; PLAN: r0=256(x), r1=19(y), r2=55(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 19
LDI r2, 55
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
