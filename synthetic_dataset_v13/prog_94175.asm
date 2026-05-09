; DESCRIPTION: Creates a purple circular shape at (211, 141) with radius 51.
; PLAN: r0=211(x), r1=141(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 141
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
