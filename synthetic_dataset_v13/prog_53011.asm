; DESCRIPTION: Composite: Sets a single yellow pixel at (142, 129) then Creates a black circular shape at (337, 162) with radius 52.
; PLAN: r0=142(x), r1=129(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=337(x), r6=162(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 142
LDI r1, 129
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 337
LDI r6, 162
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
