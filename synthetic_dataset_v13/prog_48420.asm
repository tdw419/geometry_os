; DESCRIPTION: Creates a orange circular shape at (218, 77) with radius 53.
; PLAN: r0=218(x), r1=77(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 77
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
