; DESCRIPTION: Places a purple line segment connecting (142, 3) to (392, 25).
; PLAN: r0=142(x1), r1=3(y1), r2=392(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 3
LDI r2, 392
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
