; DESCRIPTION: Creates a orange circular shape at (283, 153) with radius 61.
; PLAN: r0=283(x), r1=153(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 153
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
