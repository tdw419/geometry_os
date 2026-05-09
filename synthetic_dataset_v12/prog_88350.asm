; DESCRIPTION: Places a blue line segment connecting (430, 142) to (503, 105).
; PLAN: r0=430(x1), r1=142(y1), r2=503(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 142
LDI r2, 503
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
