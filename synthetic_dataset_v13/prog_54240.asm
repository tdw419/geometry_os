; DESCRIPTION: Composite: Draws a black circle centered at (69, 187) with radius 40 then Sets a single magenta pixel at (439, 114).
; PLAN: r0=69(x), r1=187(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x), r6=114(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 69
LDI r1, 187
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 114
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
