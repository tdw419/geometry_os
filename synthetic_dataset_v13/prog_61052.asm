; DESCRIPTION: Composite: Draws a red circle centered at (472, 159) with radius 34 then Sets a single green pixel at (125, 98).
; PLAN: r0=472(x), r1=159(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=125(x), r6=98(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 472
LDI r1, 159
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 125
LDI r6, 98
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
