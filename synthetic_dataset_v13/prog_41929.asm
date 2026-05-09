; DESCRIPTION: Draws a white rectangle at (390, 57) with width 106 and height 74.
; PLAN: r0=390(x), r1=57(y), r2=106(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 57
LDI r2, 106
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
