; DESCRIPTION: Places a black line segment connecting (419, 250) to (110, 22).
; PLAN: r0=419(x1), r1=250(y1), r2=110(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 250
LDI r2, 110
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
