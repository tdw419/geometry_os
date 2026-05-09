; DESCRIPTION: Draws a purple rectangle at (140, 104) with width 73 and height 88.
; PLAN: r0=140(x), r1=104(y), r2=73(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 104
LDI r2, 73
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
