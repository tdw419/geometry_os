; DESCRIPTION: Draws a white rectangle at (312, 18) with width 20 and height 77.
; PLAN: r0=312(x), r1=18(y), r2=20(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 18
LDI r2, 20
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
