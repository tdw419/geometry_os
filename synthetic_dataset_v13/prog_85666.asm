; DESCRIPTION: Draws a red rectangle at (147, 89) with width 15 and height 106.
; PLAN: r0=147(x), r1=89(y), r2=15(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 89
LDI r2, 15
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
