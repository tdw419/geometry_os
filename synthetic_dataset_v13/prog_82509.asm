; DESCRIPTION: Composite: Renders a orange disk with center (138, 131) and radius 76 then Sets a single black pixel at (380, 170).
; PLAN: r0=138(x), r1=131(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=380(x), r6=170(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 138
LDI r1, 131
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 380
LDI r6, 170
LDI r7, 0x000000
PSET r5, r6, r7
HALT
