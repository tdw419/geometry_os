; DESCRIPTION: Composite: Creates a yellow circular shape at (434, 149) with radius 31 then Sets a single yellow pixel at (426, 12).
; PLAN: r0=434(x), r1=149(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x), r6=12(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 434
LDI r1, 149
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 12
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
