; DESCRIPTION: Composite: Renders a yellow disk with center (304, 106) and radius 37 then Places a red dot at position (376, 41).
; PLAN: r0=304(x), r1=106(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=41(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 304
LDI r1, 106
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 41
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
