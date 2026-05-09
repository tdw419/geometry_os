; DESCRIPTION: Renders a black disk with center (102, 153) and radius 31.
; PLAN: r0=102(x), r1=153(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 153
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
