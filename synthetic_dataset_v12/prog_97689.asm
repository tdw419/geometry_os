; DESCRIPTION: Draws a purple rectangle at (167, 31) with width 88 and height 116.
; PLAN: r0=167(x), r1=31(y), r2=88(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 31
LDI r2, 88
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
