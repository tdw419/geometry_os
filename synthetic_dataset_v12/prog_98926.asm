; DESCRIPTION: Composite: Renders a cyan disk with center (303, 164) and radius 41 then Sets a single blue pixel at (354, 55).
; PLAN: r0=303(x), r1=164(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x), r6=55(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 303
LDI r1, 164
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 55
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
