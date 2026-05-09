; DESCRIPTION: Composite: Places a white circle of radius 49 at center (55, 72) then Sets a single blue pixel at (60, 101).
; PLAN: r0=55(x), r1=72(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x), r6=101(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 55
LDI r1, 72
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 101
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
