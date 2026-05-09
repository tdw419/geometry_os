; DESCRIPTION: Places a blue line segment connecting (475, 218) to (386, 110).
; PLAN: r0=475(x1), r1=218(y1), r2=386(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 218
LDI r2, 386
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
