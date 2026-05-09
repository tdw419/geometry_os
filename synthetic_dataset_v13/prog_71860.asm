; DESCRIPTION: Creates a black circular shape at (154, 26) with radius 18.
; PLAN: r0=154(x), r1=26(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 26
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
