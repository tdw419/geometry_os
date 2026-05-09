; DESCRIPTION: Draws a red rectangle at (158, 15) with width 87 and height 31.
; PLAN: r0=158(x), r1=15(y), r2=87(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 15
LDI r2, 87
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
