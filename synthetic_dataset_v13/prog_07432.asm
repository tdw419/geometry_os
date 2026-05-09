; DESCRIPTION: Composite: Draws a cyan circle centered at (321, 158) with radius 49 then Places a purple dot at position (166, 29).
; PLAN: r0=321(x), r1=158(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=29(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 158
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 29
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
