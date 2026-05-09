; DESCRIPTION: Composite: Draws a green circle centered at (245, 177) with radius 74 then Sets a single magenta pixel at (508, 60).
; PLAN: r0=245(x), r1=177(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=508(x), r6=60(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 245
LDI r1, 177
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 508
LDI r6, 60
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
