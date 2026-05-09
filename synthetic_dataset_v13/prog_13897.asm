; DESCRIPTION: Draws a green rectangle at (157, 2) with width 106 and height 51.
; PLAN: r0=157(x), r1=2(y), r2=106(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 2
LDI r2, 106
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
