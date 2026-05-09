; DESCRIPTION: Composite: Renders a yellow disk with center (292, 149) and radius 61 then Sets a single blue pixel at (292, 125).
; PLAN: r0=292(x), r1=149(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=125(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 292
LDI r1, 149
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 125
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
