; DESCRIPTION: Places a black line segment connecting (483, 232) to (9, 168).
; PLAN: r0=483(x1), r1=232(y1), r2=9(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 232
LDI r2, 9
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
