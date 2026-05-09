; DESCRIPTION: Composite: Draws a blue circle centered at (427, 235) with radius 13 then Places a yellow dot at position (55, 81).
; PLAN: r0=427(x), r1=235(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=81(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 427
LDI r1, 235
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 81
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
