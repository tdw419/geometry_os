; DESCRIPTION: Draws a orange line from (506, 26) to (321, 241).
; PLAN: r0=506(x1), r1=26(y1), r2=321(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 26
LDI r2, 321
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
