; DESCRIPTION: Draws a yellow rectangle at (201, 188) with width 45 and height 43.
; PLAN: r0=201(x), r1=188(y), r2=45(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 188
LDI r2, 45
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
