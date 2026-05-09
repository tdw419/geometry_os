; DESCRIPTION: Composite: Sets a single yellow pixel at (452, 90) then Renders a orange disk with center (414, 141) and radius 75.
; PLAN: r0=452(x), r1=90(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=414(x), r6=141(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 452
LDI r1, 90
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 414
LDI r6, 141
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
