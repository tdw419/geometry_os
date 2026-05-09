; DESCRIPTION: Draws a green rectangle at (179, 155) with width 106 and height 91.
; PLAN: r0=179(x), r1=155(y), r2=106(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 155
LDI r2, 106
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
