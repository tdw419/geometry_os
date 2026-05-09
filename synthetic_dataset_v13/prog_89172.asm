; DESCRIPTION: Places a black line segment connecting (74, 58) to (483, 62).
; PLAN: r0=74(x1), r1=58(y1), r2=483(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 58
LDI r2, 483
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
