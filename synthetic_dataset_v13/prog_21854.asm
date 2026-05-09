; DESCRIPTION: Composite: Renders a green disk with center (120, 46) and radius 14 then Sets a single green pixel at (55, 143).
; PLAN: r0=120(x), r1=46(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=143(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 46
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 143
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
