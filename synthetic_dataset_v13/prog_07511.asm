; DESCRIPTION: Draws a orange rectangle at (369, 138) with width 52 and height 99.
; PLAN: r0=369(x), r1=138(y), r2=52(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 138
LDI r2, 52
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
