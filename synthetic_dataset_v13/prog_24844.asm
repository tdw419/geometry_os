; DESCRIPTION: Draws a orange line from (475, 201) to (373, 234).
; PLAN: r0=475(x1), r1=201(y1), r2=373(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 201
LDI r2, 373
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
