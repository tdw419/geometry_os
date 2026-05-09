; DESCRIPTION: Draws a green rectangle at (233, 43) with width 117 and height 100.
; PLAN: r0=233(x), r1=43(y), r2=117(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 43
LDI r2, 117
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
