; DESCRIPTION: Places a black line segment connecting (201, 66) to (20, 240).
; PLAN: r0=201(x1), r1=66(y1), r2=20(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 66
LDI r2, 20
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
