; DESCRIPTION: Creates a green circular shape at (477, 46) with radius 10.
; PLAN: r0=477(x), r1=46(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 46
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
