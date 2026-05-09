; DESCRIPTION: Composite: Places a white circle of radius 74 at center (83, 178) then Sets a single blue pixel at (457, 197).
; PLAN: r0=83(x), r1=178(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=197(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 83
LDI r1, 178
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 197
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
