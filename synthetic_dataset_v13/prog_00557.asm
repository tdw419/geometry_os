; DESCRIPTION: Creates a orange circular shape at (199, 37) with radius 33.
; PLAN: r0=199(x), r1=37(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 37
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
