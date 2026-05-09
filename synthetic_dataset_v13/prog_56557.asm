; DESCRIPTION: Composite: Creates a yellow circular shape at (311, 88) with radius 79 then Sets a single blue pixel at (346, 117).
; PLAN: r0=311(x), r1=88(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=117(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 311
LDI r1, 88
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 117
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
