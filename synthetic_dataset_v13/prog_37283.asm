; DESCRIPTION: Composite: Places a black circle of radius 65 at center (198, 158) then Sets a single blue pixel at (107, 221).
; PLAN: r0=198(x), r1=158(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=221(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 198
LDI r1, 158
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 221
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
