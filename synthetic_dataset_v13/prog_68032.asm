; DESCRIPTION: Composite: Draws a black circle centered at (94, 92) with radius 12 then Places a white dot at position (185, 154).
; PLAN: r0=94(x), r1=92(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x), r6=154(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 94
LDI r1, 92
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 154
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
