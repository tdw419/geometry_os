; DESCRIPTION: Draws a purple rectangle at (252, 183) with width 25 and height 65.
; PLAN: r0=252(x), r1=183(y), r2=25(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 183
LDI r2, 25
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
