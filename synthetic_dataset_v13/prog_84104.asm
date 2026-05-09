; DESCRIPTION: Draws a black circle centered at (92, 133) with radius 51.
; PLAN: r0=92(x), r1=133(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 133
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
