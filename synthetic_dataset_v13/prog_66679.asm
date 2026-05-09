; DESCRIPTION: Composite: Creates a magenta circular shape at (456, 70) with radius 49 then Sets a single blue pixel at (417, 28).
; PLAN: r0=456(x), r1=70(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=417(x), r6=28(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 456
LDI r1, 70
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 417
LDI r6, 28
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
