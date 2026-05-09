; DESCRIPTION: Composite: Draws a yellow circle centered at (388, 94) with radius 65 then Places a black dot at position (2, 164).
; PLAN: r0=388(x), r1=94(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x), r6=164(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 388
LDI r1, 94
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 164
LDI r7, 0x000000
PSET r5, r6, r7
HALT
