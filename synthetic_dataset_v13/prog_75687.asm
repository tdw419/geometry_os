; DESCRIPTION: Creates a black circular shape at (425, 80) with radius 69.
; PLAN: r0=425(x), r1=80(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 80
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
