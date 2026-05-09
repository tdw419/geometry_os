; DESCRIPTION: Composite: Draws a green circle centered at (189, 95) with radius 66 then Places a white dot at position (1, 72).
; PLAN: r0=189(x), r1=95(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=1(x), r6=72(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 189
LDI r1, 95
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 1
LDI r6, 72
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
