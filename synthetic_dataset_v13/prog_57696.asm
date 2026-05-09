; DESCRIPTION: Composite: Creates a purple circular shape at (299, 91) with radius 66 then Sets a single magenta pixel at (46, 132).
; PLAN: r0=299(x), r1=91(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=132(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 299
LDI r1, 91
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 132
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
