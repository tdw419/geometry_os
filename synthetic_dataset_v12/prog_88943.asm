; DESCRIPTION: Draws a white rectangle at (232, 106) with width 95 and height 77.
; PLAN: r0=232(x), r1=106(y), r2=95(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 106
LDI r2, 95
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
