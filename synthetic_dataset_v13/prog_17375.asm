; DESCRIPTION: Composite: Draws a white circle centered at (318, 114) with radius 77 then Sets a single blue pixel at (16, 49).
; PLAN: r0=318(x), r1=114(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=16(x), r6=49(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 318
LDI r1, 114
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 16
LDI r6, 49
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
