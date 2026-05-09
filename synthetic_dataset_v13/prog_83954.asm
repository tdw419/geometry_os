; DESCRIPTION: Draws a purple rectangle at (212, 30) with width 93 and height 99.
; PLAN: r0=212(x), r1=30(y), r2=93(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 30
LDI r2, 93
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
