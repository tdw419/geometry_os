; DESCRIPTION: Places a purple line segment connecting (396, 218) to (387, 54).
; PLAN: r0=396(x1), r1=218(y1), r2=387(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 218
LDI r2, 387
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
