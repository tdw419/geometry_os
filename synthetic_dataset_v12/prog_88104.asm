; DESCRIPTION: Draws a purple rectangle at (170, 88) with width 20 and height 53.
; PLAN: r0=170(x), r1=88(y), r2=20(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 88
LDI r2, 20
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
