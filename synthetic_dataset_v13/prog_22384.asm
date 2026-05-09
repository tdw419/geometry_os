; DESCRIPTION: Draws a green rectangle at (140, 155) with width 101 and height 57.
; PLAN: r0=140(x), r1=155(y), r2=101(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 155
LDI r2, 101
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
