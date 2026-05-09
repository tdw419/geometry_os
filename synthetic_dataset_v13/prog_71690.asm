; DESCRIPTION: Draws a purple rectangle at (142, 92) with width 116 and height 94.
; PLAN: r0=142(x), r1=92(y), r2=116(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 92
LDI r2, 116
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
