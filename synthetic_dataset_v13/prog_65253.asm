; DESCRIPTION: Draws a green rectangle at (211, 159) with width 118 and height 44.
; PLAN: r0=211(x), r1=159(y), r2=118(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 159
LDI r2, 118
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
