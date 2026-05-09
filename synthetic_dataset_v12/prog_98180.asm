; DESCRIPTION: Composite: Sets a single white pixel at (237, 113) then Creates a yellow circular shape at (71, 72) with radius 53.
; PLAN: r0=237(x), r1=113(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=71(x), r6=72(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 237
LDI r1, 113
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 71
LDI r6, 72
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
