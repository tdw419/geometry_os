; DESCRIPTION: Composite: Creates a blue circular shape at (289, 81) with radius 17 then Sets a single magenta pixel at (161, 133).
; PLAN: r0=289(x), r1=81(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x), r6=133(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 289
LDI r1, 81
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 133
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
