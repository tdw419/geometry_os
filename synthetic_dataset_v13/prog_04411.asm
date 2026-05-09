; DESCRIPTION: Composite: Creates a magenta circular shape at (242, 89) with radius 63 then Sets a single cyan pixel at (496, 71).
; PLAN: r0=242(x), r1=89(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=496(x), r6=71(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 89
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 496
LDI r6, 71
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
