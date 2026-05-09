; DESCRIPTION: Composite: Sets a single orange pixel at (341, 97) then Draws a yellow circle centered at (312, 100) with radius 17.
; PLAN: r0=341(x), r1=97(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=100(y), r7=17(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 97
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 312
LDI r6, 100
LDI r7, 17
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
