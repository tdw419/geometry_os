; DESCRIPTION: Composite: Renders a black disk with center (90, 170) and radius 38 then Sets a single magenta pixel at (33, 174).
; PLAN: r0=90(x), r1=170(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=174(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 170
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 174
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
