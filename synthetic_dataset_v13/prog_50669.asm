; DESCRIPTION: Composite: Draws a green circle centered at (268, 101) with radius 61 then Places a white dot at position (236, 76).
; PLAN: r0=268(x), r1=101(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=76(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 268
LDI r1, 101
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 76
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
