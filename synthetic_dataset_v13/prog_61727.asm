; DESCRIPTION: Creates a white circular shape at (289, 171) with radius 53.
; PLAN: r0=289(x), r1=171(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 171
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
