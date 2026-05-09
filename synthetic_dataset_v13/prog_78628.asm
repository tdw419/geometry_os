; DESCRIPTION: Creates a green circular shape at (102, 112) with radius 51.
; PLAN: r0=102(x), r1=112(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 112
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
