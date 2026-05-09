; DESCRIPTION: Draws a white rectangle at (212, 201) with width 37 and height 21.
; PLAN: r0=212(x), r1=201(y), r2=37(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 201
LDI r2, 37
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
