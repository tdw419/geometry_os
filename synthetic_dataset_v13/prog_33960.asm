; DESCRIPTION: Creates a orange circular shape at (397, 105) with radius 38.
; PLAN: r0=397(x), r1=105(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 105
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
