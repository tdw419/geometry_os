; DESCRIPTION: Places a blue line segment connecting (418, 110) to (245, 11).
; PLAN: r0=418(x1), r1=110(y1), r2=245(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 110
LDI r2, 245
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
