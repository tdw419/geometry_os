; DESCRIPTION: Places a black line segment connecting (483, 126) to (324, 80).
; PLAN: r0=483(x1), r1=126(y1), r2=324(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 126
LDI r2, 324
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
