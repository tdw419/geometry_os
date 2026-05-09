; DESCRIPTION: Draws a purple rectangle at (43, 88) with width 53 and height 86.
; PLAN: r0=43(x), r1=88(y), r2=53(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 88
LDI r2, 53
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
