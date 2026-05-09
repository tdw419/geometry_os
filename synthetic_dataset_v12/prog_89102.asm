; DESCRIPTION: Draws a red rectangle at (129, 81) with width 29 and height 106.
; PLAN: r0=129(x), r1=81(y), r2=29(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 81
LDI r2, 29
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
