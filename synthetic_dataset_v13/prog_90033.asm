; DESCRIPTION: Places a black line segment connecting (24, 141) to (162, 169).
; PLAN: r0=24(x1), r1=141(y1), r2=162(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 141
LDI r2, 162
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
