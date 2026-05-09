; DESCRIPTION: Draws a white rectangle at (325, 119) with width 17 and height 83.
; PLAN: r0=325(x), r1=119(y), r2=17(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 119
LDI r2, 17
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
