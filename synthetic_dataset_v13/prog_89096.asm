; DESCRIPTION: Composite: Renders a yellow disk with center (266, 182) and radius 66 then Places a orange dot at position (475, 248).
; PLAN: r0=266(x), r1=182(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=475(x), r6=248(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 266
LDI r1, 182
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 475
LDI r6, 248
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
