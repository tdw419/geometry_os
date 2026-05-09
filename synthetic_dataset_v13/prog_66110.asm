; DESCRIPTION: Composite: Places a red circle of radius 44 at center (390, 140) then Sets a single green pixel at (352, 127).
; PLAN: r0=390(x), r1=140(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x), r6=127(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 390
LDI r1, 140
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 127
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
