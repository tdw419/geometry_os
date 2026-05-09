; DESCRIPTION: Draws a purple rectangle at (287, 175) with width 116 and height 71.
; PLAN: r0=287(x), r1=175(y), r2=116(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 175
LDI r2, 116
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
