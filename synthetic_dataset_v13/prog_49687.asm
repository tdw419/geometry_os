; DESCRIPTION: Draws a orange line from (17, 82) to (351, 212).
; PLAN: r0=17(x1), r1=82(y1), r2=351(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 82
LDI r2, 351
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
