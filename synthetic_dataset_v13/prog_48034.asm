; DESCRIPTION: Draws a purple circle centered at (206, 182) with radius 66.
; PLAN: r0=206(x), r1=182(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 182
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
