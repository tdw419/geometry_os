; DESCRIPTION: Places a black line segment connecting (169, 8) to (259, 242).
; PLAN: r0=169(x1), r1=8(y1), r2=259(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 8
LDI r2, 259
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
