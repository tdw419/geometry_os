; DESCRIPTION: Creates a white circular shape at (52, 100) with radius 10.
; PLAN: r0=52(x), r1=100(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 100
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
