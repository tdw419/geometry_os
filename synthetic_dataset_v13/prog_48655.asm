; DESCRIPTION: Draws a green rectangle at (399, 75) with width 54 and height 97.
; PLAN: r0=399(x), r1=75(y), r2=54(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 75
LDI r2, 54
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
