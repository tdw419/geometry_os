; DESCRIPTION: Composite: Places a black circle of radius 46 at center (244, 187) then Sets a single green pixel at (428, 227).
; PLAN: r0=244(x), r1=187(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=227(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 244
LDI r1, 187
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 227
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
