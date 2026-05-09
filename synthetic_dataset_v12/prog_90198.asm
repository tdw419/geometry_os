; DESCRIPTION: Draws a white rectangle at (10, 47) with width 119 and height 106.
; PLAN: r0=10(x), r1=47(y), r2=119(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 47
LDI r2, 119
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
