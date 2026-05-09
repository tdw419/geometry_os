; DESCRIPTION: Places a black line segment connecting (162, 169) to (44, 108).
; PLAN: r0=162(x1), r1=169(y1), r2=44(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 169
LDI r2, 44
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
