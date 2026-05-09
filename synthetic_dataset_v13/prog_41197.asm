; DESCRIPTION: Draws a orange line from (251, 250) to (332, 159).
; PLAN: r0=251(x1), r1=250(y1), r2=332(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 250
LDI r2, 332
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
