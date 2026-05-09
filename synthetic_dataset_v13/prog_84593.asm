; DESCRIPTION: Composite: Places a yellow line segment connecting (111, 16) to (452, 137) then Sets a single orange pixel at (43, 183).
; PLAN: r0=111(x1), r1=16(y1), r2=452(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=183(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 111
LDI r1, 16
LDI r2, 452
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 183
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
