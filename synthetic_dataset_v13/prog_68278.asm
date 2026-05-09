; DESCRIPTION: Draws a green rectangle at (9, 118) with width 81 and height 99.
; PLAN: r0=9(x), r1=118(y), r2=81(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 118
LDI r2, 81
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
