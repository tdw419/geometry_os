; DESCRIPTION: Places a blue line segment connecting (29, 112) to (61, 237).
; PLAN: r0=29(x1), r1=112(y1), r2=61(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 112
LDI r2, 61
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
