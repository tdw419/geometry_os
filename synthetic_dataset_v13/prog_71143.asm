; DESCRIPTION: Draws a green rectangle at (244, 4) with width 106 and height 91.
; PLAN: r0=244(x), r1=4(y), r2=106(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 4
LDI r2, 106
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
