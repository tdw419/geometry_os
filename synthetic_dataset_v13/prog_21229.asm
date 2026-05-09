; DESCRIPTION: Creates a black circular shape at (360, 156) with radius 78.
; PLAN: r0=360(x), r1=156(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 156
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
