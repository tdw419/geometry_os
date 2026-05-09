; DESCRIPTION: Creates a purple circular shape at (311, 166) with radius 51.
; PLAN: r0=311(x), r1=166(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 166
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
