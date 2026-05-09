; DESCRIPTION: Creates a orange circular shape at (289, 152) with radius 19.
; PLAN: r0=289(x), r1=152(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 152
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
