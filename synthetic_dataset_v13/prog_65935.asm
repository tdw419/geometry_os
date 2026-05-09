; DESCRIPTION: Draws a purple rectangle at (159, 75) with width 97 and height 32.
; PLAN: r0=159(x), r1=75(y), r2=97(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 75
LDI r2, 97
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
