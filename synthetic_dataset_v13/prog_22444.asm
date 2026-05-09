; DESCRIPTION: Places a black line segment connecting (489, 119) to (274, 20).
; PLAN: r0=489(x1), r1=119(y1), r2=274(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 119
LDI r2, 274
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
