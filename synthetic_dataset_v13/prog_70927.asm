; DESCRIPTION: Composite: Sets a single white pixel at (47, 12) then Places a purple circle of radius 77 at center (393, 115).
; PLAN: r0=47(x), r1=12(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=393(x), r6=115(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 47
LDI r1, 12
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 393
LDI r6, 115
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
