; DESCRIPTION: Draws a white rectangle at (234, 76) with width 118 and height 84.
; PLAN: r0=234(x), r1=76(y), r2=118(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 76
LDI r2, 118
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
