; DESCRIPTION: Draws a white rectangle at (208, 110) with width 11 and height 18.
; PLAN: r0=208(x), r1=110(y), r2=11(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 110
LDI r2, 11
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
