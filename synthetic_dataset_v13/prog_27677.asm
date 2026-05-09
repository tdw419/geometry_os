; DESCRIPTION: Composite: Places a magenta circle of radius 58 at center (321, 58) then Places a black dot at position (82, 140).
; PLAN: r0=321(x), r1=58(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=82(x), r6=140(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 58
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 82
LDI r6, 140
LDI r7, 0x000000
PSET r5, r6, r7
HALT
