; DESCRIPTION: Creates a black circular shape at (365, 46) with radius 34.
; PLAN: r0=365(x), r1=46(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 46
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
