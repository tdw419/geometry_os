; DESCRIPTION: Places a black line segment connecting (353, 251) to (22, 119).
; PLAN: r0=353(x1), r1=251(y1), r2=22(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 251
LDI r2, 22
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
