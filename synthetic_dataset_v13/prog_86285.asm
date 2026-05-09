; DESCRIPTION: Draws a green rectangle at (233, 37) with width 38 and height 66.
; PLAN: r0=233(x), r1=37(y), r2=38(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 37
LDI r2, 38
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
