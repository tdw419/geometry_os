; DESCRIPTION: Draws a black rectangle at (311, 118) with width 55 and height 73.
; PLAN: r0=311(x), r1=118(y), r2=55(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 118
LDI r2, 55
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
