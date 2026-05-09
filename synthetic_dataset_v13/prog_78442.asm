; DESCRIPTION: Creates a purple circular shape at (51, 187) with radius 51.
; PLAN: r0=51(x), r1=187(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 187
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
