; DESCRIPTION: Draws a purple circle centered at (312, 182) with radius 43.
; PLAN: r0=312(x), r1=182(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 182
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
