; DESCRIPTION: Composite: Renders a blue disk with center (426, 115) and radius 21 then Sets a single orange pixel at (412, 93).
; PLAN: r0=426(x), r1=115(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x), r6=93(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 115
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 93
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
