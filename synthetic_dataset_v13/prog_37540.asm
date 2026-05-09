; DESCRIPTION: Composite: Places a red circle of radius 62 at center (408, 80) then Sets a single blue pixel at (197, 230).
; PLAN: r0=408(x), r1=80(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x), r6=230(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 408
LDI r1, 80
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 230
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
