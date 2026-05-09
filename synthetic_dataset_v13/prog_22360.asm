; DESCRIPTION: Composite: Sets a single black pixel at (487, 85) then Creates a red circular shape at (350, 203) with radius 51.
; PLAN: r0=487(x), r1=85(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=203(y), r7=51(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 487
LDI r1, 85
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 350
LDI r6, 203
LDI r7, 51
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
