; DESCRIPTION: Composite: Creates a black circular shape at (109, 88) with radius 71 then Sets a single magenta pixel at (232, 52).
; PLAN: r0=109(x), r1=88(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x), r6=52(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 109
LDI r1, 88
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 52
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
