; DESCRIPTION: Draws a purple circle centered at (209, 182) with radius 51.
; PLAN: r0=209(x), r1=182(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 182
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
