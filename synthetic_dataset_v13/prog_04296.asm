; DESCRIPTION: Composite: Draws a green circle centered at (455, 180) with radius 56 then Sets a single black pixel at (272, 202).
; PLAN: r0=455(x), r1=180(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=202(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 455
LDI r1, 180
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 202
LDI r7, 0x000000
PSET r5, r6, r7
HALT
