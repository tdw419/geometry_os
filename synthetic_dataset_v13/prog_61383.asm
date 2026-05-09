; DESCRIPTION: Composite: Draws a red circle centered at (48, 192) with radius 18 then Sets a single yellow pixel at (429, 57).
; PLAN: r0=48(x), r1=192(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=429(x), r6=57(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 48
LDI r1, 192
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 429
LDI r6, 57
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
