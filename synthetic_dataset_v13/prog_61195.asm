; DESCRIPTION: Draws a green rectangle at (6, 204) with width 118 and height 31.
; PLAN: r0=6(x), r1=204(y), r2=118(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 204
LDI r2, 118
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
