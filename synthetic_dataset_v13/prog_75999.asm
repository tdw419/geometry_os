; DESCRIPTION: Composite: Renders a blue disk with center (353, 149) and radius 77 then Sets a single yellow pixel at (442, 216).
; PLAN: r0=353(x), r1=149(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x), r6=216(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 149
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 216
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
