; DESCRIPTION: Composite: Draws a white circle centered at (369, 158) with radius 74 then Sets a single magenta pixel at (322, 66).
; PLAN: r0=369(x), r1=158(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x), r6=66(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 369
LDI r1, 158
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 66
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
