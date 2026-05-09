; DESCRIPTION: Creates a white circular shape at (435, 100) with radius 51.
; PLAN: r0=435(x), r1=100(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 100
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
