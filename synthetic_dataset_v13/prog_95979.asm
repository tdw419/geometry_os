; DESCRIPTION: Composite: Creates a black circular shape at (326, 226) with radius 26 then Places a black dot at position (192, 100).
; PLAN: r0=326(x), r1=226(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=100(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 326
LDI r1, 226
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 100
LDI r7, 0x000000
PSET r5, r6, r7
HALT
