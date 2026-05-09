; DESCRIPTION: Composite: Places a yellow circle of radius 53 at center (296, 64) then Sets a single blue pixel at (142, 25).
; PLAN: r0=296(x), r1=64(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x), r6=25(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 296
LDI r1, 64
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 25
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
