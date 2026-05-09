; DESCRIPTION: Creates a orange circular shape at (83, 137) with radius 48.
; PLAN: r0=83(x), r1=137(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 137
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
