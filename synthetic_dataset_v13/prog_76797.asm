; DESCRIPTION: Draws a purple rectangle at (158, 29) with width 117 and height 65.
; PLAN: r0=158(x), r1=29(y), r2=117(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 29
LDI r2, 117
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
