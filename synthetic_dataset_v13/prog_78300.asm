; DESCRIPTION: Composite: Creates a blue circular shape at (244, 164) with radius 28 then Sets a single magenta pixel at (159, 48).
; PLAN: r0=244(x), r1=164(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x), r6=48(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 244
LDI r1, 164
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 48
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
