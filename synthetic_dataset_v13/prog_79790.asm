; DESCRIPTION: Draws a purple line from (236, 8) to (503, 223).
; PLAN: r0=236(x1), r1=8(y1), r2=503(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 8
LDI r2, 503
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
