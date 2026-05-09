; DESCRIPTION: Creates a black circular shape at (182, 56) with radius 44.
; PLAN: r0=182(x), r1=56(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 56
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
