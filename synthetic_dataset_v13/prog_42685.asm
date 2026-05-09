; DESCRIPTION: Draws a red rectangle at (395, 68) with width 52 and height 99.
; PLAN: r0=395(x), r1=68(y), r2=52(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 68
LDI r2, 52
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
