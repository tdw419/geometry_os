; DESCRIPTION: Draws a green rectangle at (160, 17) with width 117 and height 106.
; PLAN: r0=160(x), r1=17(y), r2=117(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 17
LDI r2, 117
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
