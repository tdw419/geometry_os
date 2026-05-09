; DESCRIPTION: Draws a blue line from (7, 87) to (385, 201).
; PLAN: r0=7(x1), r1=87(y1), r2=385(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 87
LDI r2, 385
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
