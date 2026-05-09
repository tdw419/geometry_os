; DESCRIPTION: Draws a black rectangle at (201, 20) with width 81 and height 11.
; PLAN: r0=201(x), r1=20(y), r2=81(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 20
LDI r2, 81
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
