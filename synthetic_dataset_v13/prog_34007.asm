; DESCRIPTION: Composite: Places a black dot at position (467, 107) then Places a orange line segment connecting (497, 156) to (99, 1).
; PLAN: r0=467(x), r1=107(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=497(x1), r6=156(y1), r7=99(x2), r8=1(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 467
LDI r1, 107
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 497
LDI r6, 156
LDI r7, 99
LDI r8, 1
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
