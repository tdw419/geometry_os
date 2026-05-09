; DESCRIPTION: Creates a white circular shape at (131, 55) with radius 30.
; PLAN: r0=131(x), r1=55(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 55
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
