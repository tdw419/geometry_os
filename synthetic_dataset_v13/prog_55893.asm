; DESCRIPTION: Places a blue line segment connecting (169, 169) to (294, 22).
; PLAN: r0=169(x1), r1=169(y1), r2=294(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 169
LDI r2, 294
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
