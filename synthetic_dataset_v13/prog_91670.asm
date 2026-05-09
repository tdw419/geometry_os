; DESCRIPTION: Creates a white circular shape at (225, 148) with radius 51.
; PLAN: r0=225(x), r1=148(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 148
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
