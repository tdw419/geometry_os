; DESCRIPTION: Creates a orange circular shape at (397, 33) with radius 33.
; PLAN: r0=397(x), r1=33(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 33
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
