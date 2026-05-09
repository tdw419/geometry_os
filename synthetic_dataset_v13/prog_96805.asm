; DESCRIPTION: Composite: Draws a white circle centered at (166, 106) with radius 24 then Sets a single green pixel at (294, 253).
; PLAN: r0=166(x), r1=106(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x), r6=253(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 166
LDI r1, 106
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 253
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
