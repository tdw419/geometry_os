; DESCRIPTION: Creates a white circular shape at (141, 153) with radius 73.
; PLAN: r0=141(x), r1=153(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 153
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
