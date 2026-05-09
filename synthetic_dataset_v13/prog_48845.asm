; DESCRIPTION: Draws a red rectangle at (84, 78) with width 29 and height 99.
; PLAN: r0=84(x), r1=78(y), r2=29(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 78
LDI r2, 29
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
