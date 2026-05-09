; DESCRIPTION: Composite: Sets a single black pixel at (293, 78) then Draws a orange circle centered at (336, 131) with radius 40.
; PLAN: r0=293(x), r1=78(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=131(y), r7=40(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 293
LDI r1, 78
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 336
LDI r6, 131
LDI r7, 40
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
