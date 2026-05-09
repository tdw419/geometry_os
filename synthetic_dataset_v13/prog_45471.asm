; DESCRIPTION: Composite: Places a magenta circle of radius 62 at center (282, 184) then Sets a single green pixel at (74, 201).
; PLAN: r0=282(x), r1=184(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=74(x), r6=201(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 282
LDI r1, 184
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 74
LDI r6, 201
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
