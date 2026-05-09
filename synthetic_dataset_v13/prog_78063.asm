; DESCRIPTION: Draws a white rectangle at (334, 90) with width 106 and height 77.
; PLAN: r0=334(x), r1=90(y), r2=106(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 90
LDI r2, 106
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
