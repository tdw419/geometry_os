; DESCRIPTION: Draws a white rectangle at (195, 22) with width 63 and height 78.
; PLAN: r0=195(x), r1=22(y), r2=63(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 22
LDI r2, 63
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
