; DESCRIPTION: Creates a green circular shape at (92, 162) with radius 51.
; PLAN: r0=92(x), r1=162(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 162
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
