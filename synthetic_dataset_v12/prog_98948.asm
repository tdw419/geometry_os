; DESCRIPTION: Draws a green rectangle at (417, 29) with width 55 and height 118.
; PLAN: r0=417(x), r1=29(y), r2=55(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 29
LDI r2, 55
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
