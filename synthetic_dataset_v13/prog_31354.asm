; DESCRIPTION: Draws a green rectangle at (136, 11) with width 112 and height 38.
; PLAN: r0=136(x), r1=11(y), r2=112(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 11
LDI r2, 112
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
