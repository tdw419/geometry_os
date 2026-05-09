; DESCRIPTION: Draws a red rectangle at (61, 137) with width 118 and height 28.
; PLAN: r0=61(x), r1=137(y), r2=118(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 137
LDI r2, 118
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
