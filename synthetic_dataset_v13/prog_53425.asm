; DESCRIPTION: Draws a white rectangle at (259, 110) with width 100 and height 89.
; PLAN: r0=259(x), r1=110(y), r2=100(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 110
LDI r2, 100
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
