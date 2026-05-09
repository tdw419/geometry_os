; DESCRIPTION: Draws a red circle centered at (145, 182) with radius 73.
; PLAN: r0=145(x), r1=182(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 182
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
