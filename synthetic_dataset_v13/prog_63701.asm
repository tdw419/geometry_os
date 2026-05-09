; DESCRIPTION: Creates a yellow circular shape at (53, 172) with radius 33.
; PLAN: r0=53(x), r1=172(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 172
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
