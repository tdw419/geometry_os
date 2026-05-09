; DESCRIPTION: Draws a purple rectangle at (216, 101) with width 56 and height 41.
; PLAN: r0=216(x), r1=101(y), r2=56(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 101
LDI r2, 56
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
