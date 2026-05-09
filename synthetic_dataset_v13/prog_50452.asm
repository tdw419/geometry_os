; DESCRIPTION: Composite: Places a magenta circle of radius 29 at center (201, 149) then Sets a single blue pixel at (78, 68).
; PLAN: r0=201(x), r1=149(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x), r6=68(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 201
LDI r1, 149
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 68
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
