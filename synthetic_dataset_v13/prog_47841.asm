; DESCRIPTION: Composite: Renders a purple disk with center (175, 78) and radius 41 then Sets a single cyan pixel at (422, 9).
; PLAN: r0=175(x), r1=78(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=9(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 175
LDI r1, 78
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 9
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
