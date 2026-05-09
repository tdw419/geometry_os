; DESCRIPTION: Composite: Sets a single blue pixel at (52, 183) then Creates a yellow circular shape at (78, 166) with radius 65.
; PLAN: r0=52(x), r1=183(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=166(y), r7=65(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 52
LDI r1, 183
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 78
LDI r6, 166
LDI r7, 65
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
