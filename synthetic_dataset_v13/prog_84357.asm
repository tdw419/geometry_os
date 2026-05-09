; DESCRIPTION: Draws a purple rectangle at (201, 142) with width 107 and height 102.
; PLAN: r0=201(x), r1=142(y), r2=107(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 142
LDI r2, 107
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
