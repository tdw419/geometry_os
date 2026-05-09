; DESCRIPTION: Composite: Places a yellow dot at position (102, 82) then Creates a purple circular shape at (200, 112) with radius 53.
; PLAN: r0=102(x), r1=82(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=112(y), r7=53(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 102
LDI r1, 82
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 200
LDI r6, 112
LDI r7, 53
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
