; DESCRIPTION: Draws a orange circle centered at (484, 114) with radius 25.
; PLAN: r0=484(x), r1=114(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 484
LDI r1, 114
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
