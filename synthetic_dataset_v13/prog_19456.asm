; DESCRIPTION: Places a purple line segment connecting (387, 227) to (487, 51).
; PLAN: r0=387(x1), r1=227(y1), r2=487(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 227
LDI r2, 487
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
