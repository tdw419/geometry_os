; DESCRIPTION: Creates a white circular shape at (223, 64) with radius 19.
; PLAN: r0=223(x), r1=64(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 64
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
