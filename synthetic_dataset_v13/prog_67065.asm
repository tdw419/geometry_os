; DESCRIPTION: Draws a green rectangle at (159, 48) with width 118 and height 58.
; PLAN: r0=159(x), r1=48(y), r2=118(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 48
LDI r2, 118
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
