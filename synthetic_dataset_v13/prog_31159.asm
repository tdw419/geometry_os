; DESCRIPTION: Composite: Creates a black circular shape at (366, 35) with radius 23 then Sets a single yellow pixel at (247, 161).
; PLAN: r0=366(x), r1=35(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=247(x), r6=161(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 366
LDI r1, 35
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 247
LDI r6, 161
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
