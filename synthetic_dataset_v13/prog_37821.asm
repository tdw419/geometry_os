; DESCRIPTION: Draws a blue line from (399, 201) to (102, 106).
; PLAN: r0=399(x1), r1=201(y1), r2=102(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 201
LDI r2, 102
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
