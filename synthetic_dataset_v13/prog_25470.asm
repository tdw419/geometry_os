; DESCRIPTION: Draws a purple circle centered at (193, 107) with radius 51.
; PLAN: r0=193(x), r1=107(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 107
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
