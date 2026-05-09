; DESCRIPTION: Draws a purple line from (448, 242) to (489, 244).
; PLAN: r0=448(x1), r1=242(y1), r2=489(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 242
LDI r2, 489
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
