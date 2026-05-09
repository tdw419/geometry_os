; DESCRIPTION: Composite: Sets a single magenta pixel at (188, 31) then Creates a red circular shape at (23, 100) with radius 19.
; PLAN: r0=188(x), r1=31(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=23(x), r6=100(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 188
LDI r1, 31
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 23
LDI r6, 100
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
