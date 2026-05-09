; DESCRIPTION: Draws a green circle centered at (388, 85) with radius 51.
; PLAN: r0=388(x), r1=85(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 85
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
