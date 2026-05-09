; DESCRIPTION: Creates a white circular shape at (449, 169) with radius 47.
; PLAN: r0=449(x), r1=169(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 169
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
