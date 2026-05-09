; DESCRIPTION: Draws a white rectangle at (347, 108) with width 14 and height 33.
; PLAN: r0=347(x), r1=108(y), r2=14(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 108
LDI r2, 14
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
