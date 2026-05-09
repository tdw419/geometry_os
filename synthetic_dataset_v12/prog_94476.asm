; DESCRIPTION: Draws a white rectangle at (431, 102) with width 43 and height 15.
; PLAN: r0=431(x), r1=102(y), r2=43(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 102
LDI r2, 43
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
