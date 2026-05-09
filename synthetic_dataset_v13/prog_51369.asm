; DESCRIPTION: Draws a purple rectangle at (158, 78) with width 89 and height 57.
; PLAN: r0=158(x), r1=78(y), r2=89(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 78
LDI r2, 89
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
