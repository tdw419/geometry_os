; DESCRIPTION: Draws a white rectangle at (100, 123) with width 11 and height 96.
; PLAN: r0=100(x), r1=123(y), r2=11(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 123
LDI r2, 11
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
