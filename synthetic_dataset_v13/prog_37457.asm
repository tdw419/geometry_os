; DESCRIPTION: Draws a green rectangle at (279, 89) with width 26 and height 77.
; PLAN: r0=279(x), r1=89(y), r2=26(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 89
LDI r2, 26
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
