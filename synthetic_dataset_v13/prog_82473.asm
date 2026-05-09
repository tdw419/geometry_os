; DESCRIPTION: Composite: Draws a yellow circle centered at (364, 83) with radius 60 then Sets a single blue pixel at (304, 49).
; PLAN: r0=364(x), r1=83(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x), r6=49(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 83
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 49
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
