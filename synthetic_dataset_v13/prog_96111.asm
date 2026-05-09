; DESCRIPTION: Draws a orange rectangle at (138, 148) with width 99 and height 20.
; PLAN: r0=138(x), r1=148(y), r2=99(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 148
LDI r2, 99
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
