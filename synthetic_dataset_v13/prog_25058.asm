; DESCRIPTION: Composite: Places a black dot at position (222, 184) then Creates a purple circular shape at (431, 156) with radius 32.
; PLAN: r0=222(x), r1=184(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=156(y), r7=32(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 222
LDI r1, 184
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 431
LDI r6, 156
LDI r7, 32
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
