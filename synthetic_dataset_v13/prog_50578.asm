; DESCRIPTION: Draws a orange circle centered at (138, 118) with radius 13.
; PLAN: r0=138(x), r1=118(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 118
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
