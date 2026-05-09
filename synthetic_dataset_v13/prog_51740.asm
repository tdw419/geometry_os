; DESCRIPTION: Draws a green rectangle at (127, 112) with width 119 and height 95.
; PLAN: r0=127(x), r1=112(y), r2=119(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 112
LDI r2, 119
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
