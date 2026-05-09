; DESCRIPTION: Composite: Places a orange dot at position (496, 162) then Places a green line segment connecting (438, 1) to (159, 143).
; PLAN: r0=496(x), r1=162(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=438(x1), r6=1(y1), r7=159(x2), r8=143(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 496
LDI r1, 162
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 438
LDI r6, 1
LDI r7, 159
LDI r8, 143
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
