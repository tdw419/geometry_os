; DESCRIPTION: Composite: Draws a cyan circle centered at (149, 148) with radius 76 then Sets a single green pixel at (326, 172).
; PLAN: r0=149(x), r1=148(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=172(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 149
LDI r1, 148
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 172
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
