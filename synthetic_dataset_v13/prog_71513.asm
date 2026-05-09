; DESCRIPTION: Places a blue line segment connecting (288, 148) to (169, 73).
; PLAN: r0=288(x1), r1=148(y1), r2=169(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 148
LDI r2, 169
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
