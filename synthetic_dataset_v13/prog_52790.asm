; DESCRIPTION: Composite: Draws a green circle centered at (133, 180) with radius 18 then Places a red dot at position (391, 136).
; PLAN: r0=133(x), r1=180(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x), r6=136(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 133
LDI r1, 180
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 136
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
