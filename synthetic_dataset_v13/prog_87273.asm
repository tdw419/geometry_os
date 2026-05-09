; DESCRIPTION: Draws a red rectangle at (40, 96) with width 89 and height 22.
; PLAN: r0=40(x), r1=96(y), r2=89(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 96
LDI r2, 89
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
