; DESCRIPTION: Draws a green rectangle at (147, 139) with width 33 and height 13.
; PLAN: r0=147(x), r1=139(y), r2=33(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 139
LDI r2, 33
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
