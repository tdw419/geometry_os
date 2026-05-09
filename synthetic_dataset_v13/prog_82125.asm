; DESCRIPTION: Draws a purple rectangle at (88, 36) with width 71 and height 61.
; PLAN: r0=88(x), r1=36(y), r2=71(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 36
LDI r2, 71
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
