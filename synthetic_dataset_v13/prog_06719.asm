; DESCRIPTION: Composite: Renders a yellow disk with center (320, 118) and radius 66 then Places a purple dot at position (508, 130).
; PLAN: r0=320(x), r1=118(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=508(x), r6=130(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 118
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 508
LDI r6, 130
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
