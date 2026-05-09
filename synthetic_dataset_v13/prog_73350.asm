; DESCRIPTION: Composite: Creates a blue circular shape at (396, 90) with radius 69 then Sets a single green pixel at (39, 160).
; PLAN: r0=396(x), r1=90(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x), r6=160(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 396
LDI r1, 90
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 160
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
