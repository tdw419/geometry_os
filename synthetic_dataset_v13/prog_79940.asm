; DESCRIPTION: Composite: Draws a cyan circle centered at (172, 43) with radius 31 then Places a magenta dot at position (400, 176).
; PLAN: r0=172(x), r1=43(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=176(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 43
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 176
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
