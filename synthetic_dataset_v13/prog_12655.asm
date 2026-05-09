; DESCRIPTION: Creates a white circular shape at (137, 80) with radius 28.
; PLAN: r0=137(x), r1=80(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 80
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
