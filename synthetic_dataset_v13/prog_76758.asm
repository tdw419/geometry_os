; DESCRIPTION: Renders a orange line between points (272, 234) and (77, 201).
; PLAN: r0=272(x1), r1=234(y1), r2=77(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 234
LDI r2, 77
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
