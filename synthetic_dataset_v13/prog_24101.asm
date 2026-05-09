; DESCRIPTION: Draws a purple rectangle at (86, 53) with width 35 and height 110.
; PLAN: r0=86(x), r1=53(y), r2=35(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 53
LDI r2, 35
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
