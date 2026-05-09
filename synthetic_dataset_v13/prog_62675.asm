; DESCRIPTION: Draws a white rectangle at (155, 179) with width 100 and height 52.
; PLAN: r0=155(x), r1=179(y), r2=100(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 179
LDI r2, 100
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
