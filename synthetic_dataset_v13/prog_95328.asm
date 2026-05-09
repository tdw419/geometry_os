; DESCRIPTION: Draws a blue line from (236, 70) to (196, 201).
; PLAN: r0=236(x1), r1=70(y1), r2=196(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 70
LDI r2, 196
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
