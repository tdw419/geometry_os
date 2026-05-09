; DESCRIPTION: Draws a blue line from (233, 72) to (503, 251).
; PLAN: r0=233(x1), r1=72(y1), r2=503(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 72
LDI r2, 503
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
