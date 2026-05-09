; DESCRIPTION: Composite: Renders a orange disk with center (323, 188) and radius 31 then Sets a single purple pixel at (0, 239).
; PLAN: r0=323(x), r1=188(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x), r6=239(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 323
LDI r1, 188
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 239
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
