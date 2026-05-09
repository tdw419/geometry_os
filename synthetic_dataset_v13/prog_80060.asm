; DESCRIPTION: Composite: Draws a black circle centered at (454, 179) with radius 47 then Places a yellow dot at position (70, 26).
; PLAN: r0=454(x), r1=179(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=26(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 454
LDI r1, 179
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 26
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
