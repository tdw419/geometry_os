; DESCRIPTION: Composite: Creates a yellow circular shape at (86, 75) with radius 70 then Places a yellow dot at position (47, 111).
; PLAN: r0=86(x), r1=75(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=111(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 86
LDI r1, 75
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 111
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
