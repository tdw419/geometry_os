; DESCRIPTION: Renders a purple box of size 13x81 starting at (318, 118).
; PLAN: r0=318(x), r1=118(y), r2=13(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 118
LDI r2, 13
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
