; DESCRIPTION: Composite: Places a green line segment connecting (424, 39) to (65, 229) then Sets a single black pixel at (496, 0).
; PLAN: r0=424(x1), r1=39(y1), r2=65(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=496(x), r6=0(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 424
LDI r1, 39
LDI r2, 65
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 0
LDI r7, 0x000000
PSET r5, r6, r7
HALT
