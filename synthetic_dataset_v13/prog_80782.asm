; DESCRIPTION: Places a purple line segment connecting (223, 143) to (503, 152).
; PLAN: r0=223(x1), r1=143(y1), r2=503(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 143
LDI r2, 503
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
