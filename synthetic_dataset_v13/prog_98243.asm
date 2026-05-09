; DESCRIPTION: Draws a white rectangle at (119, 179) with width 119 and height 45.
; PLAN: r0=119(x), r1=179(y), r2=119(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 179
LDI r2, 119
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
