; DESCRIPTION: Draws a green rectangle at (172, 75) with width 77 and height 26.
; PLAN: r0=172(x), r1=75(y), r2=77(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 75
LDI r2, 77
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
