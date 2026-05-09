; DESCRIPTION: Draws a white rectangle at (244, 17) with width 108 and height 55.
; PLAN: r0=244(x), r1=17(y), r2=108(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 17
LDI r2, 108
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
