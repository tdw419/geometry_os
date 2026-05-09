; DESCRIPTION: Draws a purple rectangle at (290, 106) with width 64 and height 15.
; PLAN: r0=290(x), r1=106(y), r2=64(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 106
LDI r2, 64
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
