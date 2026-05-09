; DESCRIPTION: Composite: Renders a blue disk with center (187, 117) and radius 41 then Sets a single purple pixel at (335, 119).
; PLAN: r0=187(x), r1=117(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=335(x), r6=119(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 187
LDI r1, 117
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 335
LDI r6, 119
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
