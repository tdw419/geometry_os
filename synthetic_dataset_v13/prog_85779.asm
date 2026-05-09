; DESCRIPTION: Draws a green rectangle at (97, 205) with width 119 and height 37.
; PLAN: r0=97(x), r1=205(y), r2=119(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 205
LDI r2, 119
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
