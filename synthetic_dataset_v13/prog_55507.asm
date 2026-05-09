; DESCRIPTION: Places a blue line segment connecting (300, 186) to (148, 218).
; PLAN: r0=300(x1), r1=186(y1), r2=148(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 186
LDI r2, 148
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
