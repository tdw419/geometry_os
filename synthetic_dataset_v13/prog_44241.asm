; DESCRIPTION: Draws a white rectangle at (201, 21) with width 63 and height 71.
; PLAN: r0=201(x), r1=21(y), r2=63(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 21
LDI r2, 63
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
