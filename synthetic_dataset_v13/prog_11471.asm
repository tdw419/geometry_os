; DESCRIPTION: Draws a black line from (458, 211) to (409, 201).
; PLAN: r0=458(x1), r1=211(y1), r2=409(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 211
LDI r2, 409
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
