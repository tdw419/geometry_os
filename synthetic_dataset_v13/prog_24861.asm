; DESCRIPTION: Draws a white rectangle at (227, 135) with width 108 and height 44.
; PLAN: r0=227(x), r1=135(y), r2=108(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 135
LDI r2, 108
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
