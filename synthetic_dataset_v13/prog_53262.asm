; DESCRIPTION: Draws a purple line from (129, 76) to (90, 80).
; PLAN: r0=129(x1), r1=76(y1), r2=90(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 76
LDI r2, 90
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
