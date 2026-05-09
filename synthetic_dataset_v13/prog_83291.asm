; DESCRIPTION: Draws a white rectangle at (49, 119) with width 43 and height 55.
; PLAN: r0=49(x), r1=119(y), r2=43(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 119
LDI r2, 43
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
