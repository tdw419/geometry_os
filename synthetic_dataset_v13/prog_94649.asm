; DESCRIPTION: Draws a white rectangle at (212, 1) with width 119 and height 23.
; PLAN: r0=212(x), r1=1(y), r2=119(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 1
LDI r2, 119
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
