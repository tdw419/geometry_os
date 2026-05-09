; DESCRIPTION: Draws a green rectangle at (353, 189) with width 22 and height 15.
; PLAN: r0=353(x), r1=189(y), r2=22(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 189
LDI r2, 22
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
