; DESCRIPTION: Creates a blue circular shape at (204, 116) with radius 51.
; PLAN: r0=204(x), r1=116(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 116
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
