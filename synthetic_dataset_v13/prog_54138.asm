; DESCRIPTION: Places a black line segment connecting (489, 86) to (40, 45).
; PLAN: r0=489(x1), r1=86(y1), r2=40(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 86
LDI r2, 40
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
