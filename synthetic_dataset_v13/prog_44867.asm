; DESCRIPTION: Creates a blue circular shape at (92, 185) with radius 64.
; PLAN: r0=92(x), r1=185(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 185
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
