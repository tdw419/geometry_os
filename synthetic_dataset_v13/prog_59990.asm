; DESCRIPTION: Draws a green rectangle at (26, 141) with width 91 and height 15.
; PLAN: r0=26(x), r1=141(y), r2=91(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 141
LDI r2, 91
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
