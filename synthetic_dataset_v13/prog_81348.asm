; DESCRIPTION: Composite: Draws a orange line from (459, 119) to (492, 11) then Sets a single green pixel at (148, 140).
; PLAN: r0=459(x1), r1=119(y1), r2=492(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=140(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 459
LDI r1, 119
LDI r2, 492
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 140
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
