; DESCRIPTION: Composite: Places a orange dot at position (408, 200) then Places a red circle of radius 10 at center (407, 245).
; PLAN: r0=408(x), r1=200(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=245(y), r7=10(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 408
LDI r1, 200
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 407
LDI r6, 245
LDI r7, 10
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
