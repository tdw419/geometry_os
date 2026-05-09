; DESCRIPTION: Draws a white rectangle at (201, 137) with width 72 and height 63.
; PLAN: r0=201(x), r1=137(y), r2=72(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 137
LDI r2, 72
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
