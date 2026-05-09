; DESCRIPTION: Composite: Sets a single yellow pixel at (148, 56) then Creates a yellow circular shape at (165, 113) with radius 80.
; PLAN: r0=148(x), r1=56(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=113(y), r7=80(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 148
LDI r1, 56
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 165
LDI r6, 113
LDI r7, 80
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
