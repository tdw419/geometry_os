; DESCRIPTION: Draws a orange circle centered at (100, 142) with radius 33.
; PLAN: r0=100(x), r1=142(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 142
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
