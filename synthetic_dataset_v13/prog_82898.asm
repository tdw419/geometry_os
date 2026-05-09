; DESCRIPTION: Places a black line segment connecting (283, 147) to (225, 35).
; PLAN: r0=283(x1), r1=147(y1), r2=225(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 147
LDI r2, 225
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
