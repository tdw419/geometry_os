; DESCRIPTION: Creates a white circular shape at (53, 171) with radius 39.
; PLAN: r0=53(x), r1=171(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 171
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
