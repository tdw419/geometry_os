; DESCRIPTION: Draws a green rectangle at (375, 169) with width 39 and height 37.
; PLAN: r0=375(x), r1=169(y), r2=39(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 169
LDI r2, 39
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
