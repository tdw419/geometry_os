; DESCRIPTION: Places a blue line segment connecting (486, 20) to (138, 237).
; PLAN: r0=486(x1), r1=20(y1), r2=138(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 20
LDI r2, 138
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
