; DESCRIPTION: Places a black line segment connecting (287, 212) to (483, 83).
; PLAN: r0=287(x1), r1=212(y1), r2=483(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 212
LDI r2, 483
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
