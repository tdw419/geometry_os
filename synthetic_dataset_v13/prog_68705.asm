; DESCRIPTION: Composite: Creates a purple circular shape at (414, 16) with radius 15 then Places a magenta dot at position (261, 75).
; PLAN: r0=414(x), r1=16(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=75(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 16
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 75
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
