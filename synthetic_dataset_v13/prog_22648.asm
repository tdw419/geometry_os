; DESCRIPTION: Draws a purple line from (277, 22) to (503, 244).
; PLAN: r0=277(x1), r1=22(y1), r2=503(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 22
LDI r2, 503
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
