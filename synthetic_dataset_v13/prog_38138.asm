; DESCRIPTION: Draws a green rectangle at (33, 20) with width 37 and height 101.
; PLAN: r0=33(x), r1=20(y), r2=37(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 20
LDI r2, 37
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
