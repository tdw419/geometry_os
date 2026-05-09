; DESCRIPTION: Places a blue line segment connecting (32, 133) to (503, 185).
; PLAN: r0=32(x1), r1=133(y1), r2=503(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 133
LDI r2, 503
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
