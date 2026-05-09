; DESCRIPTION: Composite: Sets a single blue pixel at (233, 217) then Places a red circle of radius 72 at center (388, 125).
; PLAN: r0=233(x), r1=217(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=125(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 233
LDI r1, 217
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 125
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
