; DESCRIPTION: Draws a yellow line from (476, 198) to (419, 229).
; PLAN: r0=476(x1), r1=198(y1), r2=419(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 198
LDI r2, 419
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
