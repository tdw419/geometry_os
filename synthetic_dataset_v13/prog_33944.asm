; DESCRIPTION: Creates a white circular shape at (397, 86) with radius 43.
; PLAN: r0=397(x), r1=86(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 86
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
