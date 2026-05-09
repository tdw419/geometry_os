; DESCRIPTION: Draws a red rectangle at (229, 101) with width 89 and height 39.
; PLAN: r0=229(x), r1=101(y), r2=89(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 101
LDI r2, 89
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
