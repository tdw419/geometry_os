; DESCRIPTION: Draws a white rectangle at (35, 110) with width 77 and height 89.
; PLAN: r0=35(x), r1=110(y), r2=77(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 110
LDI r2, 77
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
