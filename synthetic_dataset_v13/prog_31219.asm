; DESCRIPTION: Composite: Places a yellow line segment connecting (378, 26) to (234, 164) then Sets a single orange pixel at (361, 64).
; PLAN: r0=378(x1), r1=26(y1), r2=234(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=64(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 378
LDI r1, 26
LDI r2, 234
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 64
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
