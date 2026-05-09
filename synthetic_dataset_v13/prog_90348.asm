; DESCRIPTION: Draws a white rectangle at (222, 137) with width 19 and height 53.
; PLAN: r0=222(x), r1=137(y), r2=19(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 137
LDI r2, 19
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
