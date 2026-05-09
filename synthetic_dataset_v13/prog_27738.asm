; DESCRIPTION: Draws a orange circle centered at (60, 181) with radius 45.
; PLAN: r0=60(x), r1=181(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 181
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
