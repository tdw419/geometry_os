; DESCRIPTION: Draws a green rectangle at (144, 119) with width 94 and height 14.
; PLAN: r0=144(x), r1=119(y), r2=94(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 119
LDI r2, 94
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
