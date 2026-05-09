; DESCRIPTION: Creates a green circular shape at (131, 53) with radius 45.
; PLAN: r0=131(x), r1=53(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 53
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
