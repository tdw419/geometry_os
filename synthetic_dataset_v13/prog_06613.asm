; DESCRIPTION: Composite: Renders a black disk with center (109, 110) and radius 59 then Sets a single purple pixel at (126, 127).
; PLAN: r0=109(x), r1=110(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=127(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 109
LDI r1, 110
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 127
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
