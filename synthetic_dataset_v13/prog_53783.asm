; DESCRIPTION: Composite: Creates a purple circular shape at (415, 173) with radius 48 then Sets a single blue pixel at (319, 62).
; PLAN: r0=415(x), r1=173(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x), r6=62(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 415
LDI r1, 173
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 62
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
