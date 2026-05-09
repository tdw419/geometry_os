; DESCRIPTION: Composite: Places a green circle of radius 25 at center (434, 136) then Sets a single yellow pixel at (359, 233).
; PLAN: r0=434(x), r1=136(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x), r6=233(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 434
LDI r1, 136
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 233
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
