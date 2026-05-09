; DESCRIPTION: Composite: Creates a yellow circular shape at (185, 170) with radius 78 then Places a white dot at position (148, 111).
; PLAN: r0=185(x), r1=170(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x), r6=111(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 170
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 111
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
