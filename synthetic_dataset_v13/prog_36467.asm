; DESCRIPTION: Draws a purple rectangle at (216, 52) with width 74 and height 78.
; PLAN: r0=216(x), r1=52(y), r2=74(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 52
LDI r2, 74
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
