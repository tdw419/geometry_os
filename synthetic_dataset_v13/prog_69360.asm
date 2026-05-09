; DESCRIPTION: Composite: Draws a orange circle centered at (217, 95) with radius 69 then Sets a single green pixel at (194, 155).
; PLAN: r0=217(x), r1=95(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=155(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 217
LDI r1, 95
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 155
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
