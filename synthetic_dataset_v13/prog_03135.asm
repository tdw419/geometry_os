; DESCRIPTION: Creates a blue circular shape at (393, 92) with radius 73.
; PLAN: r0=393(x), r1=92(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 92
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
