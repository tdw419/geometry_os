; DESCRIPTION: Composite: Draws a blue circle centered at (286, 208) with radius 12 then Sets a single magenta pixel at (498, 211).
; PLAN: r0=286(x), r1=208(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x), r6=211(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 208
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 211
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
