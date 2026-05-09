; DESCRIPTION: Places a blue line segment connecting (226, 95) to (142, 48).
; PLAN: r0=226(x1), r1=95(y1), r2=142(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 95
LDI r2, 142
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
