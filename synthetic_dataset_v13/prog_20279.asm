; DESCRIPTION: Draws a green rectangle at (192, 31) with width 43 and height 119.
; PLAN: r0=192(x), r1=31(y), r2=43(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 31
LDI r2, 43
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
