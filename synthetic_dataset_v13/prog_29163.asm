; DESCRIPTION: Draws a white rectangle at (71, 0) with width 110 and height 119.
; PLAN: r0=71(x), r1=0(y), r2=110(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 0
LDI r2, 110
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
