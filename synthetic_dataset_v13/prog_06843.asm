; DESCRIPTION: Draws a orange line from (508, 223) to (478, 115).
; PLAN: r0=508(x1), r1=223(y1), r2=478(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 223
LDI r2, 478
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
