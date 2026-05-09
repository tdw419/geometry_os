; DESCRIPTION: Draws a purple rectangle at (466, 201) with width 39 and height 23.
; PLAN: r0=466(x), r1=201(y), r2=39(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 201
LDI r2, 39
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
