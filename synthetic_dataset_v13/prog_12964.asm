; DESCRIPTION: Draws a purple rectangle at (194, 116) with width 20 and height 69.
; PLAN: r0=194(x), r1=116(y), r2=20(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 116
LDI r2, 20
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
