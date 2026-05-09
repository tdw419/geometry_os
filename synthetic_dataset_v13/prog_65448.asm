; DESCRIPTION: Composite: Sets a single black pixel at (240, 241) then Places a yellow line segment connecting (429, 234) to (483, 194).
; PLAN: r0=240(x), r1=241(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=429(x1), r6=234(y1), r7=483(x2), r8=194(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 241
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 429
LDI r6, 234
LDI r7, 483
LDI r8, 194
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
