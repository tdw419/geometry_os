; DESCRIPTION: Draws a orange line from (206, 60) to (302, 201).
; PLAN: r0=206(x1), r1=60(y1), r2=302(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 60
LDI r2, 302
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
