; DESCRIPTION: Composite: Sets a single red pixel at (133, 99) then Creates a yellow circular shape at (389, 158) with radius 17.
; PLAN: r0=133(x), r1=99(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=158(y), r7=17(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 99
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 389
LDI r6, 158
LDI r7, 17
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
