; DESCRIPTION: Draws a purple rectangle at (332, 71) with width 87 and height 116.
; PLAN: r0=332(x), r1=71(y), r2=87(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 71
LDI r2, 87
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
