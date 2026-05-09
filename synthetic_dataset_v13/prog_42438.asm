; DESCRIPTION: Draws a blue line from (201, 40) to (32, 170).
; PLAN: r0=201(x1), r1=40(y1), r2=32(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 40
LDI r2, 32
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
