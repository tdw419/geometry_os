; DESCRIPTION: Draws a green rectangle at (111, 97) with width 91 and height 110.
; PLAN: r0=111(x), r1=97(y), r2=91(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 97
LDI r2, 91
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
