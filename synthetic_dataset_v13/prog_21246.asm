; DESCRIPTION: Composite: Draws a black circle centered at (414, 105) with radius 34 then Places a white dot at position (127, 56).
; PLAN: r0=414(x), r1=105(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x), r6=56(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 105
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 56
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
