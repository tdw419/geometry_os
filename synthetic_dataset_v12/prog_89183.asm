; DESCRIPTION: Draws a white rectangle at (183, 22) with width 106 and height 89.
; PLAN: r0=183(x), r1=22(y), r2=106(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 22
LDI r2, 106
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
