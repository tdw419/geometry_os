; DESCRIPTION: Draws a purple rectangle at (12, 1) with width 97 and height 116.
; PLAN: r0=12(x), r1=1(y), r2=97(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 1
LDI r2, 97
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
