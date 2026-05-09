; DESCRIPTION: Composite: Creates a magenta circular shape at (292, 192) with radius 50 then Sets a single orange pixel at (204, 72).
; PLAN: r0=292(x), r1=192(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x), r6=72(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 292
LDI r1, 192
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 72
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
