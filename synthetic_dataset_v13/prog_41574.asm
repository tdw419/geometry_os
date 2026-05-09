; DESCRIPTION: Creates a orange circular shape at (73, 200) with radius 33.
; PLAN: r0=73(x), r1=200(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 200
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
