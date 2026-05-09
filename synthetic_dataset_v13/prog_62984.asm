; DESCRIPTION: Places a black line segment connecting (138, 148) to (470, 147).
; PLAN: r0=138(x1), r1=148(y1), r2=470(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 148
LDI r2, 470
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
