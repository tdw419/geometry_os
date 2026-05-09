; DESCRIPTION: Creates a orange circular shape at (318, 48) with radius 33.
; PLAN: r0=318(x), r1=48(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 48
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
