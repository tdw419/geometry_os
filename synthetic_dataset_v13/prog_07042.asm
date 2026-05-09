; DESCRIPTION: Creates a black circular shape at (210, 78) with radius 56.
; PLAN: r0=210(x), r1=78(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 78
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
