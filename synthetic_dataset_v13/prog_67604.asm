; DESCRIPTION: Composite: Renders a red disk with center (286, 198) and radius 41 then Sets a single green pixel at (11, 192).
; PLAN: r0=286(x), r1=198(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x), r6=192(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 198
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 192
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
