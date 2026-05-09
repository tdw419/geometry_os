; DESCRIPTION: Draws a white rectangle at (84, 158) with width 30 and height 73.
; PLAN: r0=84(x), r1=158(y), r2=30(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 158
LDI r2, 30
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
