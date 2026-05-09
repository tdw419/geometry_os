; DESCRIPTION: Draws a green rectangle at (185, 216) with width 34 and height 30.
; PLAN: r0=185(x), r1=216(y), r2=34(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 216
LDI r2, 34
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
