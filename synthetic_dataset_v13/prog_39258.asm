; DESCRIPTION: Places a green line segment connecting (133, 56) to (153, 237).
; PLAN: r0=133(x1), r1=56(y1), r2=153(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 56
LDI r2, 153
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
