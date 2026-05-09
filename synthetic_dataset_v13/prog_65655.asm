; DESCRIPTION: Draws a red rectangle at (334, 150) with width 110 and height 101.
; PLAN: r0=334(x), r1=150(y), r2=110(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 150
LDI r2, 110
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
