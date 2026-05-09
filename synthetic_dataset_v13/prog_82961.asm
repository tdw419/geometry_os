; DESCRIPTION: Composite: Renders a green disk with center (245, 216) and radius 39 then Sets a single magenta pixel at (363, 171).
; PLAN: r0=245(x), r1=216(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x), r6=171(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 245
LDI r1, 216
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 171
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
