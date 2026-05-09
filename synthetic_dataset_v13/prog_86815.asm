; DESCRIPTION: Creates a orange circular shape at (78, 155) with radius 51.
; PLAN: r0=78(x), r1=155(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 155
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
