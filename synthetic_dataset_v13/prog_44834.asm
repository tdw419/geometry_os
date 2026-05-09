; DESCRIPTION: Draws a orange rectangle at (201, 14) with width 17 and height 53.
; PLAN: r0=201(x), r1=14(y), r2=17(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 14
LDI r2, 17
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
