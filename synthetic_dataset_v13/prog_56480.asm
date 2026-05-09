; DESCRIPTION: Composite: Sets a single blue pixel at (270, 244) then Creates a red circular shape at (87, 175) with radius 35.
; PLAN: r0=270(x), r1=244(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=87(x), r6=175(y), r7=35(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 270
LDI r1, 244
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 87
LDI r6, 175
LDI r7, 35
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
