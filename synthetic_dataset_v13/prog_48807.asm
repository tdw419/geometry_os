; DESCRIPTION: Draws a orange circle centered at (100, 148) with radius 78.
; PLAN: r0=100(x), r1=148(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 148
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
