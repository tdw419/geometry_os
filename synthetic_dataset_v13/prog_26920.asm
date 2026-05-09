; DESCRIPTION: Places a black line segment connecting (115, 76) to (470, 58).
; PLAN: r0=115(x1), r1=76(y1), r2=470(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 76
LDI r2, 470
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
