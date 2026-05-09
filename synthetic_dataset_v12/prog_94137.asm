; DESCRIPTION: Draws a green rectangle at (127, 47) with width 118 and height 101.
; PLAN: r0=127(x), r1=47(y), r2=118(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 47
LDI r2, 118
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
