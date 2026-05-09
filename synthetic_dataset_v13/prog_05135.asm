; DESCRIPTION: Draws a purple rectangle at (85, 54) with width 118 and height 78.
; PLAN: r0=85(x), r1=54(y), r2=118(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 54
LDI r2, 118
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
