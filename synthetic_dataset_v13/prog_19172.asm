; DESCRIPTION: Creates a orange circular shape at (250, 232) with radius 11.
; PLAN: r0=250(x), r1=232(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 232
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
