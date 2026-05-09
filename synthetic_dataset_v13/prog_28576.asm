; DESCRIPTION: Draws a white rectangle at (133, 76) with width 96 and height 106.
; PLAN: r0=133(x), r1=76(y), r2=96(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 76
LDI r2, 96
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
