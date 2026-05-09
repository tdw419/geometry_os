; DESCRIPTION: Draws a red circle centered at (274, 51) with radius 36.
; PLAN: r0=274(x), r1=51(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 51
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
