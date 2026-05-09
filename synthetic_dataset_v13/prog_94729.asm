; DESCRIPTION: Composite: Sets a single black pixel at (97, 14) then Creates a magenta circular shape at (208, 151) with radius 46.
; PLAN: r0=97(x), r1=14(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=208(x), r6=151(y), r7=46(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 97
LDI r1, 14
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 208
LDI r6, 151
LDI r7, 46
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
