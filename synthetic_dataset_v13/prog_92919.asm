; DESCRIPTION: Draws a white rectangle at (347, 100) with width 23 and height 38.
; PLAN: r0=347(x), r1=100(y), r2=23(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 100
LDI r2, 23
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
