; DESCRIPTION: Composite: Sets a single yellow pixel at (28, 62) then Creates a black circular shape at (451, 57) with radius 20.
; PLAN: r0=28(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=451(x), r6=57(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 28
LDI r1, 62
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 451
LDI r6, 57
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
