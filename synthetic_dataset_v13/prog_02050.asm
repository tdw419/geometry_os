; DESCRIPTION: Composite: Places a green dot at position (247, 199) then Places a green circle of radius 26 at center (53, 183).
; PLAN: r0=247(x), r1=199(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=183(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 199
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 53
LDI r6, 183
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
