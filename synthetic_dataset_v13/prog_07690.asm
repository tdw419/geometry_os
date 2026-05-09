; DESCRIPTION: Creates a orange circular shape at (418, 45) with radius 31.
; PLAN: r0=418(x), r1=45(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 45
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
