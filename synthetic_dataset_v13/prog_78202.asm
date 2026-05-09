; DESCRIPTION: Draws a white rectangle at (273, 188) with width 110 and height 22.
; PLAN: r0=273(x), r1=188(y), r2=110(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 188
LDI r2, 110
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
