; DESCRIPTION: Composite: Renders a orange disk with center (258, 155) and radius 66 then Sets a single magenta pixel at (87, 172).
; PLAN: r0=258(x), r1=155(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=172(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 258
LDI r1, 155
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 172
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
