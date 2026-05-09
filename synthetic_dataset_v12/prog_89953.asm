; DESCRIPTION: Places a green line segment connecting (448, 45) to (483, 46).
; PLAN: r0=448(x1), r1=45(y1), r2=483(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 45
LDI r2, 483
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
