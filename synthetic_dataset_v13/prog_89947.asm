; DESCRIPTION: Creates a white circular shape at (131, 158) with radius 17.
; PLAN: r0=131(x), r1=158(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 158
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
