; DESCRIPTION: Draws a red rectangle at (22, 137) with width 36 and height 106.
; PLAN: r0=22(x), r1=137(y), r2=36(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 137
LDI r2, 36
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
