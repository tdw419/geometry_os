; DESCRIPTION: Creates a white circular shape at (449, 30) with radius 10.
; PLAN: r0=449(x), r1=30(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 30
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
