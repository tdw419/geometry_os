; DESCRIPTION: Composite: Draws a orange line from (345, 115) to (491, 162) then Sets a single orange pixel at (72, 212).
; PLAN: r0=345(x1), r1=115(y1), r2=491(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=212(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 345
LDI r1, 115
LDI r2, 491
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 212
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
