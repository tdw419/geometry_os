; DESCRIPTION: Creates a green circular shape at (199, 143) with radius 53.
; PLAN: r0=199(x), r1=143(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 143
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
