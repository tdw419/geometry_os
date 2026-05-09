; DESCRIPTION: Composite: Draws a cyan circle centered at (140, 166) with radius 46 then Places a white dot at position (185, 63).
; PLAN: r0=140(x), r1=166(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x), r6=63(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 140
LDI r1, 166
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 63
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
