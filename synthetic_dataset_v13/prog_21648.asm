; DESCRIPTION: Composite: Sets a single black pixel at (334, 235) then Creates a cyan circular shape at (262, 112) with radius 47.
; PLAN: r0=334(x), r1=235(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=262(x), r6=112(y), r7=47(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 334
LDI r1, 235
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 262
LDI r6, 112
LDI r7, 47
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
