; DESCRIPTION: Draws a purple rectangle at (65, 85) with width 118 and height 18.
; PLAN: r0=65(x), r1=85(y), r2=118(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 85
LDI r2, 118
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
