; DESCRIPTION: Draws a blue line from (270, 102) to (201, 9).
; PLAN: r0=270(x1), r1=102(y1), r2=201(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 102
LDI r2, 201
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
