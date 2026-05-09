; DESCRIPTION: Composite: Draws a white circle centered at (150, 60) with radius 45 then Places a black dot at position (257, 99).
; PLAN: r0=150(x), r1=60(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=99(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 150
LDI r1, 60
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 99
LDI r7, 0x000000
PSET r5, r6, r7
HALT
