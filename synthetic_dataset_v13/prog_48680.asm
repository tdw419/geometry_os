; DESCRIPTION: Creates a white circular shape at (148, 113) with radius 72.
; PLAN: r0=148(x), r1=113(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 113
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
