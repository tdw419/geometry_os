; DESCRIPTION: Places a black line segment connecting (388, 31) to (80, 145).
; PLAN: r0=388(x1), r1=31(y1), r2=80(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 31
LDI r2, 80
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
