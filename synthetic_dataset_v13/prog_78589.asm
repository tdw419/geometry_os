; DESCRIPTION: Composite: Draws a black circle centered at (135, 90) with radius 66 then Sets a single yellow pixel at (64, 123).
; PLAN: r0=135(x), r1=90(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x), r6=123(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 135
LDI r1, 90
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 123
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
