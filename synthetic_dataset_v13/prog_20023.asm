; DESCRIPTION: Draws a blue line from (276, 198) to (204, 160).
; PLAN: r0=276(x1), r1=198(y1), r2=204(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 198
LDI r2, 204
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
