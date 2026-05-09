; DESCRIPTION: Draws a green rectangle at (68, 54) with width 36 and height 105.
; PLAN: r0=68(x), r1=54(y), r2=36(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 54
LDI r2, 36
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
