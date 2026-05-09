; DESCRIPTION: Draws a white rectangle at (351, 19) with width 99 and height 84.
; PLAN: r0=351(x), r1=19(y), r2=99(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 19
LDI r2, 99
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
