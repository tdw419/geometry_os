; DESCRIPTION: Draws a purple rectangle at (159, 142) with width 13 and height 17.
; PLAN: r0=159(x), r1=142(y), r2=13(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 142
LDI r2, 13
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
