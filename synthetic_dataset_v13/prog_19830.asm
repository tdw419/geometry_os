; DESCRIPTION: Draws a white rectangle at (211, 53) with width 55 and height 114.
; PLAN: r0=211(x), r1=53(y), r2=55(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 53
LDI r2, 55
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
