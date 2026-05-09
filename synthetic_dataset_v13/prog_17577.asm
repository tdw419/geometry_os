; DESCRIPTION: Draws a purple rectangle at (399, 97) with width 10 and height 115.
; PLAN: r0=399(x), r1=97(y), r2=10(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 97
LDI r2, 10
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
