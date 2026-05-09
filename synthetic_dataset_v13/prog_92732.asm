; DESCRIPTION: Creates a black circular shape at (397, 143) with radius 77.
; PLAN: r0=397(x), r1=143(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 143
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
