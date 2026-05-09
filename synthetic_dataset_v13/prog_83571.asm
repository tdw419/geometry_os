; DESCRIPTION: Draws a red rectangle at (52, 169) with width 112 and height 84.
; PLAN: r0=52(x), r1=169(y), r2=112(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 169
LDI r2, 112
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
