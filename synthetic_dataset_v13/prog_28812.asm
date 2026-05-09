; DESCRIPTION: Composite: Places a white dot at position (391, 63) then Draws a yellow circle centered at (119, 164) with radius 42.
; PLAN: r0=391(x), r1=63(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=119(x), r6=164(y), r7=42(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 391
LDI r1, 63
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 119
LDI r6, 164
LDI r7, 42
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
