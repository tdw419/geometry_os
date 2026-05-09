; DESCRIPTION: Composite: Creates a yellow circular shape at (189, 132) with radius 63 then Sets a single cyan pixel at (299, 141).
; PLAN: r0=189(x), r1=132(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x), r6=141(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 189
LDI r1, 132
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 141
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
