; DESCRIPTION: Creates a blue circular shape at (167, 51) with radius 34.
; PLAN: r0=167(x), r1=51(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 51
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
