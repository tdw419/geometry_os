; DESCRIPTION: Composite: Sets a single purple pixel at (408, 210) then Renders a green disk with center (419, 131) and radius 44.
; PLAN: r0=408(x), r1=210(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=131(y), r7=44(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 408
LDI r1, 210
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 419
LDI r6, 131
LDI r7, 44
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
