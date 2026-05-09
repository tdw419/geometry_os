; DESCRIPTION: Composite: Creates a black circular shape at (271, 149) with radius 54 then Places a orange dot at position (247, 111).
; PLAN: r0=271(x), r1=149(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=247(x), r6=111(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 149
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 247
LDI r6, 111
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
