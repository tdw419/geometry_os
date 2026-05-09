; DESCRIPTION: Draws a green rectangle at (134, 127) with width 36 and height 106.
; PLAN: r0=134(x), r1=127(y), r2=36(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 127
LDI r2, 36
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
