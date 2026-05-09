; DESCRIPTION: Composite: Sets a single magenta pixel at (80, 238) then Renders a black disk with center (142, 141) and radius 72.
; PLAN: r0=80(x), r1=238(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=142(x), r6=141(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 238
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 142
LDI r6, 141
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
