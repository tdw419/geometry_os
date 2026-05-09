; DESCRIPTION: Composite: Sets a single black pixel at (185, 75) then Creates a blue circular shape at (140, 106) with radius 47.
; PLAN: r0=185(x), r1=75(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=106(y), r7=47(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 185
LDI r1, 75
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 140
LDI r6, 106
LDI r7, 47
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
