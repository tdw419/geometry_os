; DESCRIPTION: Composite: Draws a orange circle centered at (441, 170) with radius 30 then Places a purple dot at position (250, 160).
; PLAN: r0=441(x), r1=170(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=160(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 441
LDI r1, 170
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 160
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
