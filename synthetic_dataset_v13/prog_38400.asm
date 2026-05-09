; DESCRIPTION: Composite: Draws a green circle centered at (148, 160) with radius 76 then Sets a single magenta pixel at (308, 128).
; PLAN: r0=148(x), r1=160(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x), r6=128(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 148
LDI r1, 160
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 128
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
