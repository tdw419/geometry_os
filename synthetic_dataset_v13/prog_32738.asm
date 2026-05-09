; DESCRIPTION: Creates a black circular shape at (113, 51) with radius 51.
; PLAN: r0=113(x), r1=51(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 51
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
