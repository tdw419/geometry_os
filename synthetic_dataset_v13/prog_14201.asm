; DESCRIPTION: Draws a purple rectangle at (192, 203) with width 38 and height 22.
; PLAN: r0=192(x), r1=203(y), r2=38(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 203
LDI r2, 38
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
