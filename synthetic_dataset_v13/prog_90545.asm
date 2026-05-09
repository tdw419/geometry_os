; DESCRIPTION: Composite: Places a green circle of radius 65 at center (307, 74) then Sets a single blue pixel at (466, 115).
; PLAN: r0=307(x), r1=74(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x), r6=115(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 307
LDI r1, 74
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 115
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
