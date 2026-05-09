; DESCRIPTION: Places a black line segment connecting (453, 30) to (149, 44).
; PLAN: r0=453(x1), r1=30(y1), r2=149(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 30
LDI r2, 149
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
