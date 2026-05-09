; DESCRIPTION: Draws a red rectangle at (88, 106) with width 14 and height 115.
; PLAN: r0=88(x), r1=106(y), r2=14(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 106
LDI r2, 14
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
