; DESCRIPTION: Composite: Renders a orange disk with center (301, 147) and radius 68 then Sets a single yellow pixel at (461, 138).
; PLAN: r0=301(x), r1=147(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x), r6=138(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 147
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 138
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
