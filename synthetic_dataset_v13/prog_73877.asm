; DESCRIPTION: Draws a white rectangle at (189, 185) with width 110 and height 68.
; PLAN: r0=189(x), r1=185(y), r2=110(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 185
LDI r2, 110
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
