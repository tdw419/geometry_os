; DESCRIPTION: Draws a purple rectangle at (84, 47) with width 88 and height 97.
; PLAN: r0=84(x), r1=47(y), r2=88(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 47
LDI r2, 88
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
