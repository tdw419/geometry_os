; DESCRIPTION: Draws a purple rectangle at (93, 52) with width 74 and height 28.
; PLAN: r0=93(x), r1=52(y), r2=74(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 52
LDI r2, 74
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
