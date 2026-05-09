; DESCRIPTION: Draws a magenta line from (476, 201) to (218, 110).
; PLAN: r0=476(x1), r1=201(y1), r2=218(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 201
LDI r2, 218
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
