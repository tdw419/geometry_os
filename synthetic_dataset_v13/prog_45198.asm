; DESCRIPTION: Places a black line segment connecting (13, 245) to (483, 53).
; PLAN: r0=13(x1), r1=245(y1), r2=483(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 245
LDI r2, 483
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
