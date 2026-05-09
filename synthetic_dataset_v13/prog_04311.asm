; DESCRIPTION: Draws a red circle centered at (274, 115) with radius 71.
; PLAN: r0=274(x), r1=115(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 115
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
