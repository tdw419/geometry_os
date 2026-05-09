; DESCRIPTION: Draws a green rectangle at (136, 25) with width 33 and height 107.
; PLAN: r0=136(x), r1=25(y), r2=33(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 25
LDI r2, 33
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
