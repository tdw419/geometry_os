; DESCRIPTION: Creates a black circular shape at (301, 148) with radius 11.
; PLAN: r0=301(x), r1=148(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 148
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
