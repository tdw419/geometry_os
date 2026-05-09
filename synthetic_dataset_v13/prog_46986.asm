; DESCRIPTION: Draws a purple rectangle at (76, 92) with width 52 and height 43.
; PLAN: r0=76(x), r1=92(y), r2=52(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 92
LDI r2, 52
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
