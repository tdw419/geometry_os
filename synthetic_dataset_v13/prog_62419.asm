; DESCRIPTION: Draws a white rectangle at (311, 81) with width 26 and height 64.
; PLAN: r0=311(x), r1=81(y), r2=26(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 81
LDI r2, 26
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
