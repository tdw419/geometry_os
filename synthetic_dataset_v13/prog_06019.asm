; DESCRIPTION: Draws a purple line from (503, 4) to (16, 70).
; PLAN: r0=503(x1), r1=4(y1), r2=16(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 4
LDI r2, 16
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
