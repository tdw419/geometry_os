; DESCRIPTION: Composite: Creates a cyan circular shape at (164, 185) with radius 49 then Places a black dot at position (404, 247).
; PLAN: r0=164(x), r1=185(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x), r6=247(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 164
LDI r1, 185
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 247
LDI r7, 0x000000
PSET r5, r6, r7
HALT
