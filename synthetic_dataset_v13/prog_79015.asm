; DESCRIPTION: Composite: Places a black circle of radius 19 at center (391, 108) then Places a orange dot at position (364, 33).
; PLAN: r0=391(x), r1=108(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=364(x), r6=33(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 391
LDI r1, 108
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 364
LDI r6, 33
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
