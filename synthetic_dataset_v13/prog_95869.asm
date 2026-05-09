; DESCRIPTION: Composite: Renders a yellow disk with center (139, 120) and radius 57 then Sets a single black pixel at (84, 165).
; PLAN: r0=139(x), r1=120(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=84(x), r6=165(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 139
LDI r1, 120
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 84
LDI r6, 165
LDI r7, 0x000000
PSET r5, r6, r7
HALT
