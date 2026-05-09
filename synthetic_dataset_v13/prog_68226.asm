; DESCRIPTION: Draws a blue rectangle at (201, 83) with width 58 and height 15.
; PLAN: r0=201(x), r1=83(y), r2=58(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 83
LDI r2, 58
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
