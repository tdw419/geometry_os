; DESCRIPTION: Composite: Places a purple circle of radius 34 at center (62, 219) then Sets a single black pixel at (383, 165).
; PLAN: r0=62(x), r1=219(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=165(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 62
LDI r1, 219
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 165
LDI r7, 0x000000
PSET r5, r6, r7
HALT
