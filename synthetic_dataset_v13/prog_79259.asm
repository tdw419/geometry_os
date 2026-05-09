; DESCRIPTION: Composite: Places a cyan dot at position (131, 241) then Places a orange line segment connecting (400, 75) to (159, 185).
; PLAN: r0=131(x), r1=241(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=400(x1), r6=75(y1), r7=159(x2), r8=185(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 241
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 400
LDI r6, 75
LDI r7, 159
LDI r8, 185
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
