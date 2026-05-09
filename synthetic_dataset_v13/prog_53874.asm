; DESCRIPTION: Composite: Renders a green disk with center (398, 60) and radius 45 then Sets a single magenta pixel at (408, 93).
; PLAN: r0=398(x), r1=60(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=408(x), r6=93(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 398
LDI r1, 60
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 408
LDI r6, 93
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
