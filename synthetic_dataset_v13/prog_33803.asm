; DESCRIPTION: Composite: Places a black dot at position (427, 79) then Places a orange line segment connecting (306, 216) to (511, 129).
; PLAN: r0=427(x), r1=79(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=306(x1), r6=216(y1), r7=511(x2), r8=129(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 79
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 306
LDI r6, 216
LDI r7, 511
LDI r8, 129
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
