; DESCRIPTION: Creates a white circular shape at (55, 153) with radius 28.
; PLAN: r0=55(x), r1=153(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 153
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
