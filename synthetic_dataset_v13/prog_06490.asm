; DESCRIPTION: Renders a purple box of size 118x88 starting at (166, 97).
; PLAN: r0=166(x), r1=97(y), r2=118(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 97
LDI r2, 118
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
