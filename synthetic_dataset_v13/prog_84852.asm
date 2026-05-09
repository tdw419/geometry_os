; DESCRIPTION: Draws a orange line from (251, 43) to (225, 4).
; PLAN: r0=251(x1), r1=43(y1), r2=225(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 43
LDI r2, 225
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
