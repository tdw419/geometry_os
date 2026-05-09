; DESCRIPTION: Composite: Draws a black line from (250, 78) to (174, 26) then Sets a single red pixel at (422, 28).
; PLAN: r0=250(x1), r1=78(y1), r2=174(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=28(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 78
LDI r2, 174
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 28
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
