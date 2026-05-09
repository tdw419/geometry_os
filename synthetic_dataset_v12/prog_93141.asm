; DESCRIPTION: Composite: Draws a yellow circle centered at (367, 76) with radius 18 then Sets a single yellow pixel at (188, 101).
; PLAN: r0=367(x), r1=76(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=101(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 367
LDI r1, 76
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 101
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
