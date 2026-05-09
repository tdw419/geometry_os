; DESCRIPTION: Draws a black rectangle at (201, 16) with width 86 and height 18.
; PLAN: r0=201(x), r1=16(y), r2=86(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 16
LDI r2, 86
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
