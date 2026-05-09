; DESCRIPTION: Composite: Draws a black circle centered at (350, 167) with radius 59 then Places a white dot at position (77, 176).
; PLAN: r0=350(x), r1=167(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=176(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 167
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 176
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
