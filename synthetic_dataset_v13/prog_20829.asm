; DESCRIPTION: Draws a purple rectangle at (116, 134) with width 74 and height 89.
; PLAN: r0=116(x), r1=134(y), r2=74(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 134
LDI r2, 74
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
