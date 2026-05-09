; DESCRIPTION: Draws a green rectangle at (323, 57) with width 51 and height 66.
; PLAN: r0=323(x), r1=57(y), r2=51(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 57
LDI r2, 51
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
