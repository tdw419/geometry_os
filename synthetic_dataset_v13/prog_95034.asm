; DESCRIPTION: Draws a red rectangle at (97, 89) with width 40 and height 110.
; PLAN: r0=97(x), r1=89(y), r2=40(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 89
LDI r2, 40
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
