; DESCRIPTION: Draws a purple rectangle at (245, 158) with width 115 and height 56.
; PLAN: r0=245(x), r1=158(y), r2=115(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 158
LDI r2, 115
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
