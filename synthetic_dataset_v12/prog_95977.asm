; DESCRIPTION: Places a blue line segment connecting (56, 90) to (142, 57).
; PLAN: r0=56(x1), r1=90(y1), r2=142(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 90
LDI r2, 142
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
