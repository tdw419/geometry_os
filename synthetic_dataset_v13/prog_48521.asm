; DESCRIPTION: Composite: Sets a single orange pixel at (129, 176) then Draws a green circle centered at (225, 195) with radius 44.
; PLAN: r0=129(x), r1=176(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=225(x), r6=195(y), r7=44(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 176
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 225
LDI r6, 195
LDI r7, 44
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
