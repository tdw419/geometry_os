; DESCRIPTION: Draws a black rectangle at (201, 101) with width 53 and height 49.
; PLAN: r0=201(x), r1=101(y), r2=53(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 101
LDI r2, 53
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
