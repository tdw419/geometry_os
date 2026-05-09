; DESCRIPTION: Draws a purple line from (226, 160) to (350, 244).
; PLAN: r0=226(x1), r1=160(y1), r2=350(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 160
LDI r2, 350
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
