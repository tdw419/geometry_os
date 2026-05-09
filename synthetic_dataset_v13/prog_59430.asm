; DESCRIPTION: Places a blue line segment connecting (510, 137) to (141, 10).
; PLAN: r0=510(x1), r1=137(y1), r2=141(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 137
LDI r2, 141
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
