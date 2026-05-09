; DESCRIPTION: Composite: Sets a single blue pixel at (162, 87) then Creates a black circular shape at (279, 27) with radius 25.
; PLAN: r0=162(x), r1=87(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=279(x), r6=27(y), r7=25(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 162
LDI r1, 87
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 279
LDI r6, 27
LDI r7, 25
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
