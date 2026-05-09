; DESCRIPTION: Composite: Sets a single black pixel at (484, 20) then Draws a black circle centered at (330, 100) with radius 78.
; PLAN: r0=484(x), r1=20(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=330(x), r6=100(y), r7=78(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 484
LDI r1, 20
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 330
LDI r6, 100
LDI r7, 78
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
