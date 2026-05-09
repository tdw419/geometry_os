; DESCRIPTION: Composite: Places a red circle of radius 14 at center (256, 136) then Sets a single yellow pixel at (390, 125).
; PLAN: r0=256(x), r1=136(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=390(x), r6=125(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 256
LDI r1, 136
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 390
LDI r6, 125
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
