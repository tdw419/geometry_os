; DESCRIPTION: Draws a green rectangle at (86, 186) with width 118 and height 51.
; PLAN: r0=86(x), r1=186(y), r2=118(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 186
LDI r2, 118
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
