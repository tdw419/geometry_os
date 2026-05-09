; DESCRIPTION: Draws a green rectangle at (192, 112) with width 75 and height 91.
; PLAN: r0=192(x), r1=112(y), r2=75(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 112
LDI r2, 75
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
