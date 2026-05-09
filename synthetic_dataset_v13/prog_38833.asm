; DESCRIPTION: Places a blue line segment connecting (414, 161) to (474, 169).
; PLAN: r0=414(x1), r1=161(y1), r2=474(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 161
LDI r2, 474
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
