; DESCRIPTION: Composite: Draws a purple circle centered at (153, 181) with radius 65 then Sets a single green pixel at (247, 132).
; PLAN: r0=153(x), r1=181(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=247(x), r6=132(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 153
LDI r1, 181
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 247
LDI r6, 132
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
