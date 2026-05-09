; DESCRIPTION: Places a white circle of radius 73 at center (378, 148).
; PLAN: r0=378(x), r1=148(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 148
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
