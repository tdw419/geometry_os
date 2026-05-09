; DESCRIPTION: Draws a green rectangle at (311, 79) with width 106 and height 116.
; PLAN: r0=311(x), r1=79(y), r2=106(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 79
LDI r2, 106
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
