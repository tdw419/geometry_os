; DESCRIPTION: Composite: Renders a orange line between points (370, 160) and (381, 41) then Places a orange dot at position (466, 216).
; PLAN: r0=370(x1), r1=160(y1), r2=381(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=216(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 160
LDI r2, 381
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 216
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
