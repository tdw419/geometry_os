; DESCRIPTION: Places a purple line segment connecting (82, 217) to (142, 152).
; PLAN: r0=82(x1), r1=217(y1), r2=142(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 217
LDI r2, 142
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
