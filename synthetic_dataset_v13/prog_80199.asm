; DESCRIPTION: Draws a blue line from (468, 0) to (206, 201).
; PLAN: r0=468(x1), r1=0(y1), r2=206(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 0
LDI r2, 206
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
