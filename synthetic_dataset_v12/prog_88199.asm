; DESCRIPTION: Places a black line segment connecting (163, 184) to (22, 243).
; PLAN: r0=163(x1), r1=184(y1), r2=22(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 184
LDI r2, 22
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
