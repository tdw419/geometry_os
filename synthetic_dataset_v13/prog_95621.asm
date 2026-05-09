; DESCRIPTION: Places a blue line segment connecting (142, 194) to (338, 7).
; PLAN: r0=142(x1), r1=194(y1), r2=338(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 194
LDI r2, 338
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
