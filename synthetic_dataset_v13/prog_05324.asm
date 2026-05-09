; DESCRIPTION: Composite: Draws a orange line from (75, 227) to (289, 105) then Places a orange dot at position (211, 240).
; PLAN: r0=75(x1), r1=227(y1), r2=289(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=240(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 75
LDI r1, 227
LDI r2, 289
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 240
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
