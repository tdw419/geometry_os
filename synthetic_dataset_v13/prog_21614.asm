; DESCRIPTION: Composite: Sets a single magenta pixel at (80, 77) then Renders a black disk with center (148, 86) and radius 58.
; PLAN: r0=80(x), r1=77(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=86(y), r7=58(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 77
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 148
LDI r6, 86
LDI r7, 58
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
