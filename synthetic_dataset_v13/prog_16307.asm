; DESCRIPTION: Places a blue line segment connecting (80, 161) to (253, 1).
; PLAN: r0=80(x1), r1=161(y1), r2=253(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 161
LDI r2, 253
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
