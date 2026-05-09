; DESCRIPTION: Draws a green rectangle at (170, 29) with width 14 and height 115.
; PLAN: r0=170(x), r1=29(y), r2=14(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 29
LDI r2, 14
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
