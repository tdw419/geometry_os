; DESCRIPTION: Composite: Sets a single red pixel at (429, 105) then Creates a red circular shape at (478, 59) with radius 28.
; PLAN: r0=429(x), r1=105(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=478(x), r6=59(y), r7=28(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 429
LDI r1, 105
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 478
LDI r6, 59
LDI r7, 28
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
