; DESCRIPTION: Draws a white rectangle at (472, 183) with width 31 and height 15.
; PLAN: r0=472(x), r1=183(y), r2=31(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 183
LDI r2, 31
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
