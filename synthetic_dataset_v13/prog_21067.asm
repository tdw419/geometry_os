; DESCRIPTION: Draws a green rectangle at (65, 104) with width 91 and height 84.
; PLAN: r0=65(x), r1=104(y), r2=91(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 104
LDI r2, 91
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
