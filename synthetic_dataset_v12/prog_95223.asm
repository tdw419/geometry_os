; DESCRIPTION: Draws a green rectangle at (185, 22) with width 24 and height 102.
; PLAN: r0=185(x), r1=22(y), r2=24(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 22
LDI r2, 24
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
