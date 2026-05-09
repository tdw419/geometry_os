; DESCRIPTION: Places a purple line segment connecting (447, 60) to (387, 51).
; PLAN: r0=447(x1), r1=60(y1), r2=387(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 60
LDI r2, 387
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
