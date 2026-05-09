; DESCRIPTION: Composite: Draws a green circle centered at (117, 93) with radius 10 then Places a black dot at position (24, 126).
; PLAN: r0=117(x), r1=93(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=126(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 117
LDI r1, 93
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 126
LDI r7, 0x000000
PSET r5, r6, r7
HALT
