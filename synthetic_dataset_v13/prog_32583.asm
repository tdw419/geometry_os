; DESCRIPTION: Composite: Renders a blue disk with center (172, 164) and radius 31 then Sets a single white pixel at (323, 178).
; PLAN: r0=172(x), r1=164(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=178(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 164
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 178
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
