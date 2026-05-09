; DESCRIPTION: Draws a purple circle centered at (179, 51) with radius 50.
; PLAN: r0=179(x), r1=51(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 51
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
