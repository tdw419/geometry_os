; DESCRIPTION: Draws a purple rectangle at (269, 66) with width 76 and height 88.
; PLAN: r0=269(x), r1=66(y), r2=76(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 66
LDI r2, 76
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
