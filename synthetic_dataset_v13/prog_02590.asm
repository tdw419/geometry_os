; DESCRIPTION: Creates a white circular shape at (317, 101) with radius 20.
; PLAN: r0=317(x), r1=101(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 101
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
