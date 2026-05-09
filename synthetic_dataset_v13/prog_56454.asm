; DESCRIPTION: Composite: Creates a magenta circular shape at (144, 140) with radius 79 then Sets a single orange pixel at (61, 204).
; PLAN: r0=144(x), r1=140(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x), r6=204(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 144
LDI r1, 140
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 204
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
