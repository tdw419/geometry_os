; DESCRIPTION: Draws a white rectangle at (249, 0) with width 12 and height 110.
; PLAN: r0=249(x), r1=0(y), r2=12(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 0
LDI r2, 12
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
