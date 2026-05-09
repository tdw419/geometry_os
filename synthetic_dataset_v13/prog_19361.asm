; DESCRIPTION: Composite: Places a black circle of radius 33 at center (346, 216) then Sets a single green pixel at (366, 81).
; PLAN: r0=346(x), r1=216(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=366(x), r6=81(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 346
LDI r1, 216
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 366
LDI r6, 81
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
