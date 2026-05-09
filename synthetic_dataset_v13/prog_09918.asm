; DESCRIPTION: Composite: Sets a single magenta pixel at (223, 134) then Creates a blue circular shape at (78, 102) with radius 48.
; PLAN: r0=223(x), r1=134(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=102(y), r7=48(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 223
LDI r1, 134
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 78
LDI r6, 102
LDI r7, 48
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
